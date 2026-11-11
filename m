Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBA4606A880
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3A9zMBrU;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=evKsmU2B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6zc51yP1yyqwUTaBMuMnYvDSExq8ZCf3ml7XedQo+C0=; b=3A9zMBrUJRq5UwwOb0hOVt9ePQ
	6lMWrgbhBr0BVySvORJxcTgEvjeA9baHFgwdYxfyqAR2YC7ET9R91d+JzvrlrrGTq36T++U88iuL4
	KDJX3CrgADsHqitjrXlxxkrrYlHD8wit/Z9NGHqJHjdoB648v59k1HsYHZAqDmERpbYKXkQwGyNSQ
	NHgEK8qsbgpjuCk8hCdVPJl2ptS4Epbn9YhSZBym6pom6CA/VYPUrkJX/3C0t3OSdKtBouMX/JGWE
	WY2x2ke1Fhu2zNytMmdiDD/s1Gr8bKNXH6woshPDkv9GB5QHS5eWWyWmoC3Fzy2l/g0yllBIDzdHH
	ciQYe+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDcM-00000007TWT-2vfE;
	Wed, 11 Nov 2026 19:04:22 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDcK-00000007TW6-03HM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:04:21 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so2194494a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 11:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423858; x=1795028658; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6zc51yP1yyqwUTaBMuMnYvDSExq8ZCf3ml7XedQo+C0=;
        b=evKsmU2BrQ+Me/g0hZcMmmN9dlF3fuanCVe3h2IRaIWe4BYy6eWxwF+2ncSks3jJ21
         5XwM12306mHGFWd/wPqRgfPKvdz1kiRBtMwMqe8bqy5qSirJn2cGq4VQ96SzuXnycjkw
         667TztIFNbUyajJzxjjn8mIXD5g9SJUHtolAmTJ8iq4Uvg6oED2AYzeKld1zmw9mhITR
         9yhbJ45eh19zfisCTsg4wwQ5CMVYKqVAiou4AnvqyGrXr00+ez90B47OsQlLqfoTiQH2
         qiyfG05HA1BKK92O7grFRgqNDWrS1fBdISXf5/D1tZCHZgr8KAinHHblnGllqD7YkmRO
         44ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423858; x=1795028658;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6zc51yP1yyqwUTaBMuMnYvDSExq8ZCf3ml7XedQo+C0=;
        b=KXxISGp2LgcRdSzfyhVc/jqFvAmkTJYZUM7ZxSYpiKMPCbYDmp0TewEnQEHL90LIgg
         l58/8fmYmr9Rfgdx3nlujSfMnl/zKmqTweaGAj/zwurj27++aZYpTV4f8P8s9fEsyZKb
         ZvNY/nMETLsE1qjLcu9S0HdGlcBN+fUPRcVZ2O5KLgFal5tR9Uel2/W7MVOKE/Vm6r6Q
         ROXxab0ePwm7MMBzpC53f2hXZVVtovlDwQgMp7xfDrKIQEDrgG19hA8KuAXMjrj+/jUc
         /AFDz7W3Z6I2R9KXd+tONod96e5dGC84Ws524NO1dFixw+q1oyrvBX/bu4I9ftpYov+E
         aDCA==
X-Forwarded-Encrypted: i=1; AL+hErEoN7LdlGqKKz/0COxFCtFUKECO/hDvDxhKEyctovWgp0PWwvwv3PuxpmMNYoKa17dyFeSvjr25aC11y4KeTFjf@lists.infradead.org
X-Gm-Message-State: APuU4Z9LWmCCWEMCCDu93Wv5y+aHWPs/nN0EKq8Fa0NsVCw6fDT1P43i
	aFvl6FDCj1vu451kmA7GOl57DocnlajIpHSPxCmWwyYqcsKfNElL4piu
X-Gm-Gg: AYBFou1eyMM/pFBycRkJkbLDRURoNfyR1rrw/8a+7mcuuyeIamJ0Hqnemo+y0G5lVLd
	9NeM+ODpui6jhhr+W3WR2m6oRKeXZYgA9tO+g7kWtDd8oNVSyVB2I6dS8OxsAXDM3gW9lzK+us6
	qC4GZUOp2sV6W2trK1oIypTt/LUuVQ1zdnSPjQ/dHMyX4HcjRdN1OHCeIsdAEmFUtzatYn3W66A
	0uYwxfuzYhCHQUPc0O0AhGXy9Asl3Wm5nl1SOMYxt81lCuj3KxwlciVvFQaV63Lvnr7xNxzhMEJ
	N2DPJzHCuK8/dcsMWY6JNJ/NIHhW5XfjTZIkm9ENn4j3VwyeTWP9Pcp9bG1TwXHHgVXMBEI5ZoX
	ViyJrFwysmERX4zhhwO+D9Mrg78ItWVVwOGB2wYWtACK9/td88oLwp+s78/3eALKA+AzIEoNoEB
	ScHpKeUKwx8RwuodG5Hw4loPlkqsFhrnyOn9/Mpemk4C1OvryOBzUCOOTpvm709j7fOlG03KliU
	n+pNCjA4j5Zafsxy2X6FHWxZifH/Udtyara9cVGWOmSGVPZLEltY/t3FhFQxfOk+eXLUf/dhs5D
	5FC8aChVb4P1p9ja32QQdncQ1AMbq5ZMtw==
X-Received: by 2002:a17:90a:e7d1:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3b182e9415emr3092987a91.17.1794423857979;
        Wed, 11 Nov 2026 11:04:17 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:16 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH v2 0/7] ARM: dts: Add Apalis iMX6 overlays
Date: Wed, 11 Nov 2026 16:03:56 -0300
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABy89GoC/x3MOwqAMAwA0KtIZgO2SkGvIg5RUw34o4GiFO9uc
 XzLS6AchBW6IkHgKCrnkWHLAqaVjoVR5mywlXXGVDWODUaLdNEmirLfDs/IYaNHkV0zeTKtm72
 BHFyBvdx/3g/v+wFShYHwbAAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=3193;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=sVz8tk9YnISmAo/N9+CFSdVkyiddkfKtwMakiw1SLiQ=;
 b=iPp0AI/CNJytJkCqQIgPV7xNs61v8TcBmtBWw+K1Uoo3T28/y54J1tqQNkUc+ZpeI1xvQtBp8
 d7H6Vw5IRyyDwnIc7j+fwu4AJ77hmdeIA+mh1XJ2ufCJZOi1z3BW9NU
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_110420_064983_21AAA3D8 
X-CRM114-Status: GOOD (  12.05  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds device tree overlays for the Apalis iMX6 SoM. The
overlays cover parallel and LVDS displays, audio configuration and
OV5640 CSI camera modules.

The series adds support for:

- Toradex Capacitive Touch Display 10.1" LVDS
- Toradex Capacitive and Resistive Touch 7" Parallel Displays
- NAU8822 Bridge Tied Load configuration on the Apalis Evaluation Board V1.2
- Toradex OV5640 CSI camera variants with 27 MHz and 24 MHz oscillators

The Makefile entries build the standalone overlays as DTBOs, and add
ready-to-use composed DTBs for selected carrier boards and accessory
combinations, for build-time coverage. Additionally, this series adds
ready-to-use DTBs with HDMI enabled, combining the carrier board device
trees with the common imx-hdmi.dtso.

This series depends on another patch series and should be applied after it:

    - https://lore.kernel.org/imx/20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com/T/#t

    Adds the HDMI overlay common to i.MX SoCs, imx-hdmi.dtso. This is
    necessary to add the HDMI-enabled ready-to-use DTBs, and for the
    patches to apply cleanly.

Changes in v2:
  - Don't add the imx6q-apalis-hdmi.dtso overlay, and instead rely on
    the recently proposed common imx-hdmi.dtso.
  - Include 'tdx' in the display panel overlay names, to make it clear that
    these are Toradex products. Add 'v1' in the Toradex Capacitive Touch
    Display 10.1" LVDS display overlay, to make the product version explicit.
  - Link to v1: https://lore.kernel.org/all/20261001155412.3177428-1-leoreis.costa@gmail.com/T/#u

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (7):
      ARM: dts: imx6q-apalis: Add ready-to-use DTBs with HDMI enabled
      ARM: dts: imx6q-apalis-ixora: Add 3.3V_SW power regulator
      ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 10.1" LVDS
      ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 7" Parallel
      ARM: dts: imx6q-apalis: Add Toradex Resistive Touch Display 7" Parallel
      ARM: dts: imx6q-apalis: Add NAU8822 Bridge Tied Load
      ARM: dts: imx6q-apalis: Add Toradex OV5640 CSI Cameras

 arch/arm/boot/dts/nxp/imx/Makefile                 | 86 ++++++++++++++++++++++
 .../imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso    | 15 ++++
 .../boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts   |  7 ++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts   |  7 ++
 .../dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso     | 17 +++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi | 68 +++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso | 18 +++++
 ...-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtso | 53 +++++++++++++
 ...-apalis-tdx-panel-cap-touch-7inch-parallel.dtso | 34 +++++++++
 ...-apalis-tdx-panel-res-touch-7inch-parallel.dtso | 30 ++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      | 86 ----------------------
 11 files changed, 335 insertions(+), 86 deletions(-)
---
base-commit: c260ba495ecd8dc5639be9a45a70cb56391078a6
change-id: 20261103-b4-v2-apalis-imx6-overlays-e64cfa196df1

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>



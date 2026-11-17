Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087F4606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U8XgBpqP;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bgIAn2rY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=65x/rmOi9eSRyE50YMLG+5ikwTFST6PY1hiF0uL56W0=; b=U8XgBpqPpgsWZ9kqK8yu1D69L0
	ZlsAG2y7gvKPqHdaQMAptAC/j9QEHneYPGYxYpT2vq36absA2l6byPJV0jomptfQK/fHci9uXrJvA
	+92ZS4wHm55LAhTHyMG2fBpR3gXZR7BTukw6CMjfHLIzjXf+rPc/60I2gYvU+fwhwI7EZUyZ9mD81
	3ijL2140mAir92LZvqZTHTkDuSTWuvgE2t/Zbxys//EBUZsTTjNPrQPh5PvNqErmv9Qc8u0pzH/pC
	wGHC+0JNIWW0tpe+CESUl+nvY18i27b2wfCIFKMFZByzN5LhFPHLVPYlrtgjsxlLWwFoYir1BJNH2
	cGBHHojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIYO-00000005iHZ-3oWP;
	Tue, 17 Nov 2026 12:44:52 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIYM-00000005iGY-1k1S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:44:51 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2e9d7791b00so46085995ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 04:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919489; x=1795524289; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=65x/rmOi9eSRyE50YMLG+5ikwTFST6PY1hiF0uL56W0=;
        b=bgIAn2rYpzYVSFJC1E3kx9s1V8hV48o/tDqvEEHwfXISLq/G/U0qqxaHJ3+9oWxc7k
         IMsDsN4ltJVeH9j/CtH69XSwkT8RKlPKaez9j2jRWGG7rFokItSq8uyS90knAqgnvnV0
         EgfPY+8PoflkMayDgTkqumAI1Z1yp6angNyL6qP+hhFO8AK90XpoD/9BIBnF5zgVkJn4
         OPwCbZV/TpaSjZUJcKfiLMFFiMHJSKLWyI/7wO3AfQyU7DuOeAKlr92Smz0Kob0yr8Zf
         fAqflGeeLUckTmji5cHoEARt2Dq+hB15fGfxYiHnIcCj0Y7ga/U7IBhbGyD9j+b6uANj
         2MRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919489; x=1795524289;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=65x/rmOi9eSRyE50YMLG+5ikwTFST6PY1hiF0uL56W0=;
        b=Drf9XJLnk4I8GT3MeqXfhUlP3BFdUZ1tmL58MKk68Lw/5IBlC3UVXc2EljtsrfybRp
         HnQ1ce4ssUHCZ5j3tc5SkVunZfC4262pOApDwiDt2iRzeRhYQ1HzTUqO/cxuV91hqOaC
         a3TiaglCDg28iedXw/OAu/qXOPsPK/mmB45pSsva1ZoC7dQoWzLtXTfrYiUHwGd4hUMH
         Njnbfn4vZReW1sCAZ1PI8/ZpXE5ti9AmEyqs04v3P0fZaET8LvofvrR6MWwR5pi9TKpE
         zN66ATqB0gw3iz2o83E+A4cmXnoUNikiabc2SEIPUY808Jr0hzozExuy+GzeZsJV5mlB
         R0yw==
X-Forwarded-Encrypted: i=1; AL+hErGBlNRKi6zCd3SPywZqE1yernY2yfOrhbS0KJmw3PEACun5YkZebGVDLV+itm7UcaiLRxMeFlaIqohLIx3/2eu9@lists.infradead.org
X-Gm-Message-State: APuU4Z/HW/PykFYU0BR0Em81QC2b15TOw71zOUlKp4vHf8TjS3D1QK3w
	MEfym8sfFsA/UvE8PyzMPrypnOsQkNgbp4cLuA7UzBi1lmVSSCGAuRgy
X-Gm-Gg: AZFdTZc0963H0u3Jbho+oepOUfp4J/aElGPrBRJT5uZvmdwDkxwd0AVCIjqKk9HrBbp
	+KIZWIzx6rNgzNH94ynEB7HjH4O7XmgXbAqrzcpRD/pPsmTj43jdIZ9Lwoi2mE+WRvczRc5gEOI
	HDdu8LhisqNWh7AJB8Lb83UP2JTEP1DGvWgJuii5OAnJVgrzGvKDiZmlVfiWhX5PiJ+PrL4v89X
	4PdtbA8pzWr5EKO4m1hrwcBluhVZdPNWdpwIm2YEVvwIMJthon8sxNEveOswPW8j6aI2kyfOwJU
	843JNkTXfT2E8vOqYT9hYY/6SCRDHcw+fWqVRKdIMkvPq3+s/eKlchxWZJwHKXqrP8wyGvGIPDQ
	IIN1kO46jlwqRGtaQjZWerMZC/gJn9U+vuuoXAguQA6/h/WvAihl4H5KDCTAyz713et87joBaFe
	WUdU5YHeD4canXP2lVKQvqizvowkno7g5Dix+E3x8whhL4SzOnNzksrzRFVF2S7yJLlyd7XaXdr
	nfGiPB05YL0y26EmazS9nlUYNr4TWmBPijfmC5NtTK9EVDkJYjWhd2vmUc8I9DDTFCIW0WeXBc1
	BOipKZzkuS8XweKHpMy2MIU8IofAwY6D3g==
X-Received: by 2002:a17:903:19c8:b0:2df:9655:fe24 with SMTP id d9443c01a7336-2ee0dcd06d5mr119181965ad.30.1794919488900;
        Tue, 17 Nov 2026 04:44:48 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a85f1dsm14585725ad.59.2026.11.17.04.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:44:47 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH v2 0/2] Add Toradex DSI to LVDS adapter with the 10.1" V2
 display
Date: Tue, 17 Nov 2026 09:44:12 -0300
Message-Id: <20261117-v2-imx8mm-verdin-add-lvds-v2-v2-0-ecfd237cf7ee@toradex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABxM/GoC/x3MQQqEMAxA0atI1gbaLmLxKuKiTqIGbGdooQji3
 ae6fHz4FxTJKgXG7oIsVYt+U4PrO/jsIW2Cys3gjCNrLWF1qPH0MWKVzJowMONRuTwlkCe/UBA
 zGGiLX5ZVz3c/zff9B0l3gv5uAAAA
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919484; l=1590;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=Fj2m0UsmYRbogE2wB5gnwQa+eW5qWmp45T7j+6XBwIM=;
 b=l2PR4FEDB+ESaSkJf52gV0k6GKWc9FUD8b8QzlURaMMAOj6dohZg5elkpgnWtzvKi+8fj40LO
 n7rxq6nv+elD/Y1f1gYBh68+aCmZ0Hq64vyvicESYUrrZ+YW5RC4fxy
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_044450_479527_887A0802 
X-CRM114-Status: GOOD (  11.71  )
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

This patch series adds the device tree overlay for the Toradex
Capacitive Touch Display 10.1" LVDS V2 through the DSI to LVDS bridge on
the Verdin iMX8M Mini.

It also renames the existing DSI to LVDS adapter with the 10.1" V1 display
overlay, to keep a consistent naming scheme with the V2 and with the other
Toradex Displays being introduced.

Changes from v1:
- Rename the V1 display overlay to include the 'tdx-' prefix and the
  '-v1' suffix, to make it clear that this is a Toradex product, and to
  make the major version explicit.
- Use the new naming convention for the LVDS V2 display overlay.
- Add comment explaining the usage of rising edge for TOUCH_INT# in the
  DSI to LVDS bridge with the 10.1" LVDS V2 display overlay.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (2):
      arm64: dts: freescale: imx8mm-verdin: Rename Toradex display overlays
      arm64: dts: freescale: imx8mm-verdin: Add Toradex DSI to LVDS adapter with the 10.1" V2 display

 arch/arm64/boot/dts/freescale/Makefile             |  34 +++---
 ...dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso} |   0
 ...-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso | 134 +++++++++++++++++++++
 ...8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtso} |   0
 ...x8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtso} |   0
 5 files changed, 153 insertions(+), 15 deletions(-)
---
base-commit: 33adc96ac217d6e95b7c44ac383c19ca4ae2ff52
change-id: 20261116-v2-imx8mm-verdin-add-lvds-v2-a6868b6ae070

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>



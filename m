Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5752606A8B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ykugvLfe;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9XdladX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IlVBna1TtvWg7z53GTsHNVCmcCxandIEmUciwncBErA=; b=ykugvLfeJ5il85DoHoSIlkN7b2
	nn8jOipW6tBIOlnvLmm2MfElg2THAVK5n0LtCTZG/ze/uPhBtdP9n8KSIaHPAD8wKW36NivqVYKyb
	TMufN9/MysUlNSmKD7/ubjnqg00yqmu/3MayuizufKeV/uTI2eysyWAK7trC1exOE7lUQoCwEMUNj
	lo5m9e3MhELDtk/0QHcNOAeisABJGmyWQEExUS3ERUZfRt2AEEnx0fm0xORz8x+tVChnxdSYEA6Ii
	Z2FSIcn0yX9fWOM6qlA/3lube1X0ml5Cvda9q4hnRwD0Oeug7KacJNnqDZQEKwcaSST1wBMiDWBtw
	j2+ShAvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtSN-0000000DR30-1lAk;
	Fri, 13 Nov 2026 15:44:51 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtSK-0000000DR2X-0mTK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:44:49 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-8b305d38bafso8900877b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 07:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584686; x=1795189486; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IlVBna1TtvWg7z53GTsHNVCmcCxandIEmUciwncBErA=;
        b=R9XdladXxYJwRTYRyraAEiJFqZspsRu2CqXrN/zktebGzfj+IaXvz34h38tbHCj53F
         JUyfZXuppu6bNanpDpEHMeBI+s3nSLbxiJyzH1swjSwI8gKqiZm8xaLW/nreOy3T9wVN
         s/lgMudwOlysZ9jQJfH0MuCf81/Gv3l+dbtbDvz9eLm6X6GgTQ8kUH6b2kbRotfPsIjw
         HZqALwH6kphoMD0/3LJqdSJmV1KlS7k92YZd/ttwVN6fKPE7xw192Wr5rziD6BZ6Cv/i
         Cqu6zrykDLsDWBQKqG87do393+/qv3kl0yd4ubDrIZIvRvVv+6tk7QAscaJmMVH/xd20
         +3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584686; x=1795189486;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IlVBna1TtvWg7z53GTsHNVCmcCxandIEmUciwncBErA=;
        b=YgFIATOSpWQonZ5pQlfSBmLDiiCrzeOtnkMc00CeUovnxrEZ5j8rH9J2QSQIqVkAG3
         NALdXpkF84dYzpF4zk7Gu+fUEMsIdL5AKSH4j3WXsTVBGd6fhulwO8aBM6BFCwq7qgU9
         Ij4noxfnGQw+9JF5A/niYw/pInwYtCUBEykVkBgqg0WQG8rhlKb0ey6hi8ajYxtSldnN
         tH5vqhtX4o8fU/2kzAjR9HIGqgqLoTfXj333inP9a3BGPrBAPkn6y6duHtpieap9V90v
         NM+ovnPCeCqNpYQ/ZPx+jI0CRhojjScowZPIuZ/b0Ci2XUTe/bdnCwnRWYAa4oOnb2Mk
         rtUg==
X-Forwarded-Encrypted: i=1; AL+hErEj1pN/7L7egK/977YC6OOD1XCD+PiWrOzOua8Qu3sheYC+tnzyDzz9i8UucojnMsUWDdfn35C6AOZ83XstboVb@lists.infradead.org
X-Gm-Message-State: APuU4Z83OmFY//i6O4SOFtumiH0EosmccvOD+7iwPkRL0oaCRPsM0Acr
	nAhAVLIVjHCoKIvaoTj5tUF1dgO+x0X8Hk+hghLLx1eC8JDaOWkzyUcd
X-Gm-Gg: AYBFou1SE8ShojLeAHdCuTNX/MsUXcfxYjVt+WdhaUY78Q30RmEzhonGPQMw/slme4s
	m9HUvCHuHq+bd9nycdTdStmX7rqM7SSDmACXpLuGo9NQda0wXbEaHEfZfuJHQXL7mfByG8N8ege
	BJAKW9pAnB9xBierN+tfS0qjVUrOE7fh8Z7A8Qtu9iZ6rFS7pvyw/2aK7YRdR1vHYkEZTLfCGPi
	eHZsH8sdJzittPR1l7hhWbZRyUHU8akaFSp5tV08tNMgQt39ISfMIeCTR//8uwSZbrVMXTW60zs
	cw6jFY39+Qp8lmSrl7Lh1SkzV79wGVhz8JheGjFShO5xvjvueixgGCasFvquubR+toOdAkN7dh7
	pxoM9vcSCFv4GeRSxI0w+hs0CIzwzF0E2lBlRwba1A7XTCa0PKKL9ZlQeE8LH95KT4qsjVKSEnx
	ZWR1o7CwSSDfcw2MwHVMkTtG7DVEMwcU3aleh22QcHUeOyPJJE6PPkMZ3GBDmDT9ukQkanCEgqY
	XUgltUYXNPXuM4N1Vgc2QAD81fFHk3lHWeSJHpAs/Pp3gCZ7WUuUhRfayt6mvMbNKzit+3lQogE
	HTfny8Oe0eodcsCvmkAfiamJ6yTC+fNt
X-Received: by 2002:a05:690c:c:b0:8b0:acc6:8e5c with SMTP id 00721157ae682-8b4aa0d010bmr18869707b3.9.1794584686400;
        Fri, 13 Nov 2026 07:44:46 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:44:45 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH v2 0/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 Capacitive Touch Display 10.1" LVDS V1 and V2
Date: Fri, 13 Nov 2026 12:44:06 -0300
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-0-59c45f0a0d8e@toradex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEYw92oC/x2N0QqDMAxFf0XyvECtTmS/MvZQmrgF2irJKA7x3
 1d8u4d74BxgrMIGj+4A5Soma2ngbx3ETyhvRqHG4J2feufuWD0GzUhfw0WZLYbUnLzPecPKSlI
 wEGGqZEhiWwo/w7U913DDGAfH89hPBK2xKS+yX/3n6zz/kx2AHY8AAAA=
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=2077;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=Q2mTJ7efr148vCErD5HWpVyB0Hsq6rr3sJWLD+6PnOo=;
 b=vwPliPd0FIeZAo0T7lJ0fzGLYLA2vrxZUR15hNJE5V8Dv3HtNT1J36I0IQnXVen2qdujDfggD
 A7g9G3o0h54BRVOY8/FFs151oqWBfQUf+LD4RD6K2r/B8BQ0hV/Z0AQ
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_074448_240027_2A22D4EE 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
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

This series adds device tree overlays for the Toradex Capacitive Touch
Display 10.1" LVDS V1 and V2 with the Verdin iMX8M Plus SoM.

The display addition covers two interface types:

- Native LCDIF (LVDS)
- DSI-to-LVDS adapter based on the SN65DSI84

Changes from v1:
  - Include 'tdx' in the display panel overlay names, to make it clear
    that these are Toradex products, and add 'v1' in the Toradex
    Capacitive Touch Display 10.1" LVDS overlay, similarly to how it's
    done with the V2 display.
  - Link to v1: https://lore.kernel.org/linux-devicetree/20260813133335.1941580-1-leoreis.costa@gmail.com/T/#t

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (6):
      arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS
      arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter with 10.1" display
      arm64: dts: freescale: imx8mp-verdin: Add Mezzanine with Toradex Display 10.1" LVDS
      arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS V2
      arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter with the 10.1" V2 display
      arm64: dts: freescale: imx8mp-verdin: Add Mezzanine with Toradex Display 10.1" LVDS V2

 arch/arm64/boot/dts/freescale/Makefile             |  30 +++++
 ...zzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso |  71 ++++++++++++
 ...zzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtso | 107 +++++++++++++++++
 ...-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso |  94 +++++++++++++++
 ...-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso | 129 +++++++++++++++++++++
 ...-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso |  95 +++++++++++++++
 ...-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso | 118 +++++++++++++++++++
 7 files changed, 644 insertions(+)
---
base-commit: 33adc96ac217d6e95b7c44ac383c19ca4ae2ff52
change-id: 20261005-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-034c30e8416d

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>



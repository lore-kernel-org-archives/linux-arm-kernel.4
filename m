Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8054660A2605
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nvrxnwKO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2b91LDk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UJErp4fTnHGZEK0HkRaGyYzZp8fJDCcyD6a4aGJJ3a0=; b=nvrxnwKOi6BNsTAy8OQOolRBNy
	Y3KW8TsSfalGKZ0ZcTHm2j7ejuis+QUHZZhOyDxRWONIRkYD/6KPit/asVNrtSWRgvEjN3Y5mFOjC
	9wIYi6cgPkCmEQa0lauD3pYHo4XtlmkznGzj4BIQN5eZ1DcdII3xAhnG9H9WGlAAza1XA69b1uP7A
	tmR7wsFj9CqKQqGXK2wGpmeyMBgfoQ177uJ9Drt6MEzIDkioUk08KfqsiHg6CtgWQAuu3h0MY1Uho
	LKztnBRjkqLFQDLjQJ0hDA8i5FuCt5aUGy2wXBrslWyLqT+lJuJIZaIZ3nfLhn29SgTRsXgVd/zUl
	mOEsAcDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjZS-00000003Y87-0XIb;
	Tue, 10 Nov 2026 10:59:22 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjZP-00000003Y6Z-10q3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:59:20 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso797605f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 02:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308357; x=1794913157; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UJErp4fTnHGZEK0HkRaGyYzZp8fJDCcyD6a4aGJJ3a0=;
        b=E2b91LDkfGMalLkW+GYFB8TretwoP/WQwdAf8z86JbUGv8dkuFzoRqmG+7NZCDE5LZ
         1HIcR6ZdnSY+fm2jZcQtBayM14VPRKVJVY0ZFxG7rTY14bpUlbx6xHOatTbcX6kTk4Km
         ZCy38QGrPDWMARHobhcZQ+sF1dOOTSP8+sTNCcm4OkBwgjgp9MC5lMEC26C86l3DYP/l
         w0kmrDteZpCvrnpKSSgyY6kkd4ScU0Qbu/YCePodQ05te6N7bzDSyecb4GPec+5tC4im
         RXd0lfR27KBDfr2rpL5kVsRt4eQI6ueNfeKJD5AYCZ4QJjyNvj+/krILPl0rVZkbBEhR
         y+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308357; x=1794913157;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UJErp4fTnHGZEK0HkRaGyYzZp8fJDCcyD6a4aGJJ3a0=;
        b=N2NksBduFGy7bXX4kqzAuhVWmjjpqR/353e+giUw1x7p4MVWu612aBhFMRAiNwPoup
         eAAkDj0rLmKQnsWPrmOaCCt4VIjpNRnp683gQgyfYzsaf6KnKo5ld20jDNow2AkDz8Lz
         DlJP2sFf1qKmq23OcTS0eNvPJ+eGFx8klHLWxT3hxemBKFWJj9rQTfkxiAFZH91ZzjIF
         GkXtiqe6//7oXnghbeUcM1kFlvTYHh9dIoD0YcR5Eb8cqTSFwRdHo4cUCb44qRV4ReWI
         B9fWWljv5lCX+ZU9RPKtVjsNCEOu0GwFCLQSopSHtBGJrTcjb6z5s3UTZ7SVv+lpXeEx
         s6aQ==
X-Forwarded-Encrypted: i=1; AL+hErHh6EuEFq+jjSU88NE/et4yb5Olel2J8OHzfbZP+cihFwou1cK0SZ8Fmry/9wMwsm3jsczNfUp0YX8C+5cxPXuC@lists.infradead.org
X-Gm-Message-State: APuU4Z9CiYDBOpPV5gm3V2Vnqclwao2pxRxF4ErYY6v41QnajXUPdQqZ
	B5VwKI3pZBkmB/+VyRfT/v9z9B44lQN0+QuYtn35VEwvCxO6kG/Y12j2
X-Gm-Gg: AYBFou2BqALwO7Ho93GOyv0tp7ltPjzBeOsjSqZ+dUqDEaF+rAEgQnPwer3xk9vg9+G
	kYS9kL1yA1ljPTTHSZI4yWEmeakWq+fd8qTUP6IEtMO7MKpMPmIQ1dkIWg3A29YfEboKDvSY0Gy
	SW5hyNKf9aq+eEsOMDlWTOKlJG7tCILlrC8durFst8oLWOxX3b5z7GzuPz0hxRTPYWkBDwqvoeU
	I45nhPyG12QeCc7nz//Je1dqTCyatrLgU5/DF+lKcQVG9yTcwmw131v7XtcgFB3ofvxw78PztyE
	L3Icwb54KieWY1zxNSiBDpHGjpqqnxqCao8SkY4K06/O5+wkCbtbLAfrshgyNmLTB9jgdwCn54c
	UwjVsSoCHaO1Xk1gS3h0bWt+c8kAnTbOFUrAEUmgGSp7ANe/tIsOD0wzFKkEpN5Q2vwFbz/IVnO
	aVHTxcH/fyBmmhtK55eBsSvrt04sNNmSPDFqdiRrMgSMrBclYQbDnfnkNNqA4eumwOjdzVQwJ2d
	Q0QpK8yFX1HSOaaiRZDhfrVh1C+jO8XpKAnpvUFWo6mcDXnfHVRGGaXq8Vg974B1DuCON1q9yqh
	O4wUuhNCYYCzskgy9s7xToq3VEmxp4sXB++LbcBCfGzGyEFm0wsvN5M8sSIZ5gIZxLp9Q905jJb
	mwRi5FaGAYTFSlC/fXfnsJdPYI4BYa/oaOZMK9bVHwFqKbEvpoZ8=
X-Received: by 2002:a05:600c:3e88:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4ba022c9b40mr36726835e9.0.1794308356995;
        Tue, 10 Nov 2026 02:59:16 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:16 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Subject: [PATCH v2 0/6] ARM: dts: Add Colibri iMX6 overlays
Date: Tue, 10 Nov 2026 11:59:12 +0100
Message-Id: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7Zh2REBX3sOwKHSQSYCa1jQQ0
 rtbuYDL95L//g6BvXCAe7GD5yhB3JKBTgX0o1lejGIzAymqtNI37N0knReUea3QRfaT2QKaqzV
 Nyd2gqYa8fXseZD26zzbzKOHj/HbcRP2z/4pRo0IuraKmpvrS0CMHjOX13LsZ2pTSF8ftL8u8A
 AAA
X-Change-ID: 20261019-colibri-imx6-overlays-a5da84ebf127
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1986;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=RGp/rEfbSkTgb/XJ9d5cOGIySUNjBN/q8d0hynymqts=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JNZUnrRga3XGc5UPHh2d8EKpUfHb+/01uYwzVepk
 +f4Jm+8vaOUhUGMi0FWTJEl44mqIJ9CiKwHR3MyzBxWJpAhDFycAjARhjiGf7r6VxitJX6FSvy5
 3MxW9/vdD5t8DfetugU8XPwrWU8khTAydK97pucj3H6ieKUe7+c4wYeh2+rLRftMxQ/Z3HvKtJe
 PCQA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_025919_303139_E660A7E2 
X-CRM114-Status: GOOD (  10.61  )
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

This series adds device tree overlays for the Colibri iMX6 SoM. The
overlays cover HDMI, VGA and parallel displays.

The series adds support for:

- HDMI Displays, through a generic i.MX6QDL HDMI overlay
- Toradex Capacitive and Resistive Touch 7" Parallel Displays
- VGA Displays

The Makefile entries build the standalone overlays as DTBOs, and add
ready-to-use composed DTBs for selected carrier boards and accessory
combinations, for build-time coverage.

Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
Changes in v2:
- Include 'tdx' in the display panel overlay names, to make it clear that
  these are Toradex products.
- Replace the Colibri-specific HDMI overlay with a generic imx-hdmi
  overlay that can be shared by i.MX6QDL boards, as suggested by Frank.
- Link to v1: https://lore.kernel.org/r/20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com

---
Antoine Gouby (6):
      ARM: dts: imx: Add generic HDMI overlay
      ARM: dts: imx6dl-colibri: Add HDMI DTBs
      ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch Display 7" Parallel
      ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch Display 7" Parallel with Touch Adapter
      ARM: dts: imx6dl-colibri: Add Toradex Resistive Touch Display 7" Parallel
      ARM: dts: imx6dl-colibri: Add VGA overlay

 arch/arm/boot/dts/nxp/imx/Makefile                 | 85 ++++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx-hdmi.dtso            | 14 ++++
 ...nel-cap-touch-7inch-parallel-touch-adapter.dtso | 57 +++++++++++++++
 ...colibri-tdx-panel-cap-touch-7inch-parallel.dtso | 38 ++++++++++
 ...colibri-tdx-panel-res-touch-7inch-parallel.dtso | 29 ++++++++
 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso  | 67 +++++++++++++++++
 6 files changed, 290 insertions(+)
---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261019-colibri-imx6-overlays-a5da84ebf127

Best regards,
-- 
Antoine Gouby <antoine.gouby@toradex.com>



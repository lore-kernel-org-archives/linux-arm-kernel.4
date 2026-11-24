Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93B4606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WlORW52z;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rIN1gAEa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Q+MVnOFEFwJuVi0O8xTOZaHRbvIQr13a56K4pIcT3Po=; b=WlORW52zQFPUcbO5lrhRWpZTAn
	w8oTyFq4hdy+cmiH9dVEVBAQPF+QlgJw4BvotNg2Mx9NS+XcTmVyNOoRl48lvFFl6oYypQuKSSTfY
	k7/tk0y4s2UN+3UCjGuCoQ9ys7+emMuIGHMU9Ok0rsbEB3M+uHDd1j3g2SFzwZdCTBoquFT7hSE4E
	tiZllBhZ5Pu0jvLpFL4NHbIZffjLZaIZwRxQTECCvMcjQMvNDp8nXpdu/WfcSRVA1RlhWg9v+D5//
	U9XM6FfmS+SeHiQXtZ6Cxx7Xf1M12BXwPkALkouhCqD4qr77w07MGvT+fjwqW9PUmGOKISbG+I5O9
	KyQ+OfMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyQU-00000007vL0-2bP2;
	Tue, 24 Nov 2026 21:51:46 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyQR-00000007vJc-2F4k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:51:44 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so4749990f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557101; x=1796161901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+MVnOFEFwJuVi0O8xTOZaHRbvIQr13a56K4pIcT3Po=;
        b=rIN1gAEaFPhGOqYRSTWVWOZJJY15S8bCh+kypfh1bQiRb+1B+3WhsBW6yEdGdxYmiY
         orpNhbtjNTNjK7vYSZtSCAVPe0dHycasR7gxZlzuBtdGYEGO4ESdoUpUM0GGiMd11TJm
         lL9piSX0QzMX9/mis740PABYWD5HjkqfBwTIRh7qBl3P14TD734B1Px89yhod2gAo4z+
         AIbRZzKLv6BjpjLFuiTbWCoxG/eEfD3qHJVVB2ZKLQRlSttIoImOXb1/j5riirKkTSCu
         W6CNG9M+/FwnT8HuwP0RFf3jFZxs5RiL5B2KwWjj+xnnDNkXS1Z0Bm+eYjRtNZUmbMpL
         6DNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557101; x=1796161901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+MVnOFEFwJuVi0O8xTOZaHRbvIQr13a56K4pIcT3Po=;
        b=BnOXrV6sWc/2fXmobjgVU+K4mfbHd88J9B3t4D9B7kmMclt12fVbdZOspPFDTADT5r
         Xywzk/CoZMqmRLeiGi8+Fy8TfPx3+PSnJec8eZfg3pRdbjn39Ixy3xlFQXN3K0cJqv2l
         xbnZ/3/poZ/D0xvvWl1SiXidu8xlVxw1c4dtjbnpTJoh/waVwce1OKerscn4MpLjRgP1
         Z+zDJgt8NqVl5z203c1Tr+0+SxyTQeFokh9Oddgek4WDxRUwpN+hZmn3B1Yk1mTosHDb
         ulCNC9/El9k/AlW9vi8Y24CEWgzrO4KzyEst9eb8ulsZXjGbqCTCEFxVWLNMfdHKh1kG
         AoFg==
X-Forwarded-Encrypted: i=1; AL+hErEao18po27GaRU2/aPFciLIFpxKi188458sGTfH2M4sjCOVn/1/ivu52Dqs2ut09daXtLiV5XcOq1gI98XZNO3p@lists.infradead.org
X-Gm-Message-State: APuU4Z+mZlFmQ+hvBtuqZB4qLdoJYwBdlbGMst+nW5fSmLG2zio+syap
	0HIlS7x+BqdFxgR3sxfdg3DRYELyMFILjWHynajZFXcCkINVbfEFEmH3Lg9kTtSaw2s=
X-Gm-Gg: AZFdTZeVk23MKVikJ+2n5fa9VUUjX5HP5kCEd0tjDynSHCGfmHi5tvsxgRUJp/7F1gr
	a1LxrNhUlxhM0diLslfQeztq/5pYdfLyDxCaoSiTFLYwA28MHT4dPnKc82dZ2zskWIeMUMR6SmQ
	TsAhW37FS+O0PuI4adYPiCEHfFV/yX3cE8M1u7pGfO8ojjZtAdjPHVGe/1bzixPzrYxgInQjRUb
	gJ3kt2VNZb29B3CxFCu0hgLhyjf0b7qhSUiEH1m/ReUCssQy/DFuMoJEw8vLfQmEqmq4U+xHZmO
	CB777vWZaw7d2I16wJuXZ2AInzZclk7TEndC+4USJyyazA2ZCE1LmCjsRXXg5O4xWlISknvUDnu
	wBYObEu6ZyjTIArmGdZ5C7UKa9WB08BADS5kOEzYQ097AexOW0qlSNyjAymbks4LPMhHaSgketm
	74knghKrHCKD/3o+jTECHPRBabPTpV8ZCJrtUojYH5q4nM9u6zXizmNO96rJaTjsaPBr5uruV1B
	DWn2fUv1520+cwHkb2jwWAUsIrjYbv2Xm4EIuQR+OdXgcFPWN/bLwyWN34mqKhRRPWv0qCJNGsF
	qxUeeda/48MTDchEJOjKQtXe/X28YlKWTI5zNBDNdQ==
X-Received: by 2002:a5d:5d87:0:b0:4b8:db69:1b4a with SMTP id ffacd0b85a97d-4b8db691b7fmr2464923f8f.55.1795557101212;
        Tue, 24 Nov 2026 13:51:41 -0800 (PST)
Received: from debian ([185.57.100.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm29194685f8f.0.2026.11.24.13.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:51:40 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH RESEND v3 0/3] pinctrl: sunxi: number the IRQ banks from the first one that has IRQs
Date: Tue, 24 Nov 2026 21:50:45 +0000
Message-ID: <20261124215048.42074-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_135143_591189_31709CEF 
X-CRM114-Status: GOOD (  11.36  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DT pinctrl helper numbers the IRQ banks from PA, even when PA has
none. The A523 got a DT interrupt for its unimplemented PA bank to work
around that, the A733 would need the same, and on both PK is written
past the end of irq_array.

Number the IRQ banks like the static drivers do, with irq_bank_map for
the A523 and A733, and drop the PA interrupt from the binding and the
A523 DT. The B288 (IRQ banks on PB, PD, PF and PG) then needs no
made-up interrupt.

RESEND:
- rebased on v7.4-rc1, no changes
- add Rob's ack on 2/3

v3:
- apply irq_bank_map to the A733 register layout too (Sashiko)

v2:
- give the A523 and A733 an irq_bank_map, and drop the PA interrupt
  from the binding and the A523 DT

Pablo Mazzini (3):
  pinctrl: sunxi: dt: number the IRQ banks from the first one that has
    IRQs
  dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
  arm64: dts: allwinner: a523: drop the PA GPIO interrupt

 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 +--
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c               | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c                  | 8 +++-----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h                     | 7 ++++---
 6 files changed, 17 insertions(+), 16 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.52.1



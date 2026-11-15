Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6587606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 13:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bWdSG/l9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ICvD+HIh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=e+XhTX2eaPWhWUwMyLtivdGIpKoHtQC9s8D9BjgPLlI=; b=bWdSG/l9Uho0uAUybdNU54Eh37
	Ir63gK6AwdCnteGJXvNwSko1mB+91BQ1Re/nzZqrDU5KWELBxsXmO6L5pLCIsBM8R6i8BBNyKQcXW
	bxrAv2JWAFfC0t0SRFDOV3v+lkdyebR0N4QzD0H/nqKkYeGuXKjmPlgS8Qv9b56zQrbs2eNPeDTmS
	XLnIoRe6959pJrPwON3sFVILFFFnnrjVmRJQldEarbFXPYS1CUGe1epxBce66zIEXDlWM5w3G3S0B
	tE3zcIS9bNXppXh34yDzvSLRNJSib4+XueZNU8I2onZZJEBJrUj1Jh5W/nY1CI4cimPb88LfTE4mY
	5jDDncaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSaBf-0000000HYQL-1fy7;
	Sun, 15 Nov 2026 13:22:27 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSaBc-0000000HYPd-1PJY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 13:22:25 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1252272f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 05:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748942; x=1795353742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e+XhTX2eaPWhWUwMyLtivdGIpKoHtQC9s8D9BjgPLlI=;
        b=ICvD+HIhU0mT17AlCJXEWdGFIIDI1E+qWSqc8+rrgATj2ht+xo7p4wKGh8kN1QLP9c
         E9y099yJAjYEIXcohkCf3QvnQAjt2TgaR4oe+kP0pm+bKGvPQ10aNhFZ3oBfPKRozGao
         mgAiGQJPLc0myqI/vga4Qcpnh6SOX9UmCqeO7PoLZWqYCwO0qNVofK1okAnUJfRKEHAA
         PZ5013nCtsM4RfsElvEBPna3CuemTnOV3R5lvIQ1ZEqUn5hr69lEPZm3X1izaxwRJ9hf
         6oEKo7G7p4cIC/fYnnHlnxaEIkwAsWFaScETkD4HWFJnOhzGBMtO5jYFfT3bi45XhG6w
         5XSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748942; x=1795353742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+XhTX2eaPWhWUwMyLtivdGIpKoHtQC9s8D9BjgPLlI=;
        b=b/ssWZhY3UGTnZFblPGcoCIzXwAG4ZQtmiSF965wzShKwzkVdlaeXt6Bnc2ShVQ1L2
         mhJgy2ascHKaw1DIUu2wVkevRsg0xJHx8Ig5dbZuDkf3rkdNgn6sq06jExWlnCIPbMO9
         OfIlqsLCFKloqLh5kS8QnNBRLBfK5tEO8ewraamG/RRSqa2SxjGigYQ/yWwcEgJjGxJJ
         l7HNAqryqtYdm4UfgCPN9n0T7QSO7hvn5a76XFpsoWKdl+0hcTAn4o5cF68pGfRYgsFA
         mxXv879hUxLzmxKfaa26UHeehhsdO6Z6GwYre+92Zr/LkRkkYOywFgYfiAEWYLq7pp52
         y2RQ==
X-Forwarded-Encrypted: i=1; AL+hErFbyNS4DNeS8Q7DVtS85LKM1MnO6Vmp2NDN54XLrB77aNeoGmgNbeNIcl5F0JfZ4008dX+3ROXql9ov2GurU6RQ@lists.infradead.org
X-Gm-Message-State: APuU4Z8nP4A4QgLXPN/zF4lMNANJTXO1O8WVbMRTP+TWRVAV7dcmteTq
	0wvbBIiecYf1TP60qzyJ2gV7lfMCd2jCGapJ7ogDAmZfrsaGKFlGVACN
X-Gm-Gg: AYBFou1tFP4GsHrl56OTC60K3Ee1QInyYdla3suaXIWi9zMul1uPihBtada4sTSJNO4
	TvB/T2yJuYMpSavhXHsGkc++IdWjIkO3nr9bsRpspaDzby4lFGu4+SR00q/IY/DpCYMJ3wnlXOQ
	fTRe/NLImRMjLDY+lXJRDTlE8O8EM43iH3RvjcuHOj+z8wXZvk/tZVJMKky3FfNNDmd/IQnjoX7
	udaEIpq12idGrr7AY2AlaJMLFt6roMk4aygAVtprqtMOfn4Dpcf0rlFCdr7wzdM/8HJwAY0TPKb
	nCMNn8CgSAgRUQ9yqaSbzsqDta5iHs93340IUNQUqb7weVwwEp9L+nsuQ08uFkaUYfUf9HgkK6Q
	D29KR8DpN2pb+nn/DmXrxKdtGNGxd/ZD18KqNdJfNlsMyDBtrayHjk9nqw1HeZhGAH9G5InGovk
	2ULTk1gwMkcn9jtXB+2WjkuFhaIOFIIoCxdbOEstb6h6/XSQ6LMzPYvtY1qUGxUt794+DB+4x7e
	11/PvTiDLcZVeNAIEjR8PbSJy9p6x800lyWDH9j6bTmnrjdtSwVXRJcaEvfCg9na+4Iwqge5b07
	WzgwC4QwgD/fFRj/sHOeAAx1REsnCm6fkfssT/oLInIIB+5713Rnftv6+se0owm1OPUJDD6TteB
	Og/OlzNHeCyeCCRyzOnouvf5suOvNTB9nnG8e9vYAFwttDz5S6Z400GD/6YG788ELWEfbWKUkj7
	0QT3N+Z4/FAlsEAt3co8DjsKub9+L5UC0lRvinZ2BjNC87nCIg3+XtggQshu634J4oan+FroDVM
	Y1r5xLxAkzNGSYEPTcSjOZ4kghcCj6V6rQ=
X-Received: by 2002:a05:600c:3b07:b0:4bb:5de1:e912 with SMTP id 5b1f17b1804b1-4bb5de1f216mr129069365e9.1.1794748942112;
        Sun, 15 Nov 2026 05:22:22 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm18406672f8f.1.2026.11.15.05.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:22:21 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: allwinner: h6: Enable GPU and CPU DVFS on more boards
Date: Sun, 15 Nov 2026 14:22:11 +0100
Message-ID: <20261115132215.289236-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_052224_385705_4256A997 
X-CRM114-Status: GOOD (  10.23  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Most H6 boards don't use the GPU OPP table, and the Orange Pi One Plus
and Lite2 lack CPU DVFS as well, so their GPU and CPU run at a fixed
clock rate. This series enables both.

Changes in v2:
- new patch 1: add regulator-ramp-delay to vdd-cpu and vdd-gpu on the
  Orange Pi One Plus and Lite2, like on the other AXP805-based H6 boards

Link to v1: https://lore.kernel.org/linux-sunxi/20261104184940.882833-1-jernej.skrabec@gmail.com/

Jernej Skrabec (3):
  arm64: dts: allwinner: h6: orangepi: Add regulator ramp delays
  arm64: dts: allwinner: h6: Add GPU OPP table to all boards
  arm64: dts: allwinner: h6: orangepi: Enable CPU frequency scaling

 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi  | 8 ++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts   | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi     | 1 +
 4 files changed, 11 insertions(+)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0



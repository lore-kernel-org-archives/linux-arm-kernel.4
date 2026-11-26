Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A700606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 18:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OKO6qGq4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iYZBuLAL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=owBndUl6B98qwPRw0FXk88D41lLAkcYrE6f1l+yGymg=; b=OKO6qGq4oxr3AW9q3sCqeTIHIv
	EEdj0RSiNz6Gz+p1WLHbIo7SggddF+UFSepFGNsnk5WE6sSzTFe+F7614v8DOoOzQi0hswWgYUEen
	zCvcW+nsrKfyh/Aaap3QdXR1LWmLVBl0b2DG/vCuJfeIMXTrcQnW/gsYkVUIW5CcmnO6iMGLzhi0q
	znZHBLTFEgcruxJX/xTfVixbmC05j37/5gcfgkgsuPj5H1Ew8EuK+Xmz9XIHizgLfavrOmP04PRAS
	BiS5o+Kw8F7gFplUV/JUA+7Co7bBvniwG7FUXD8HJDoTebPUqGRLSuMY+ZJrNnTccOXE1k3eVFVPn
	nWtFmNCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeEE-0000000EB2g-1izR;
	Thu, 26 Nov 2026 18:29:54 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeEB-0000000EB1Q-1qQH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 18:29:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so19272825e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 10:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795717789; x=1796322589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=owBndUl6B98qwPRw0FXk88D41lLAkcYrE6f1l+yGymg=;
        b=iYZBuLALJxCytjjkgKt95p1afCJAw/e8HoTtrnVyoSpDMZq/h0En/pKfak618Xh4BE
         S7j4NXfnkX6Kt8lZyW0uUKjBY4bwv4Q6Z/xQMNYSWDDrZTcXdYq4jHC2eKzN1vKhs+NI
         G8gw7rdE/Kz9JzPCZN3o04Ek7aU8GFXWs0khiY/RrMof48+iejnFT/WzieLhMcA+ucSL
         tcuBemQlYnT/PlIRixiYWvcO4tiLaaN31x6ANDe6sNE80NWYyraoCmOXstw8C6+D74mT
         glbQtr3JlaEGNNc5KyMyRuoXzonQtrp4ROyRem/Xr8UhraFiel/YPbkWdFk7ryGcFfy1
         YrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717789; x=1796322589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=owBndUl6B98qwPRw0FXk88D41lLAkcYrE6f1l+yGymg=;
        b=T81a+b12JY/Bj/aLpiEMJO0rDr0fb3b7H/G6YB9U7CEekWhvS0MmY87RBO/zNaQPA1
         fMEJobzry6cOCOg9LyRZglCIP1zCNDggUUdRN9gDoUg0JZhn6thhq2fonjnbfdAQnAYf
         mK1JY/wqL+h62D+hZqfNWcs5ibcKYykp9YONsU2DJvcn7fJM5rNHdskoLIFc1DDdH+JC
         rm0nfSo6AYCyVGo7cCkZlq7gRNQrwt31Vf3SYY2zwrJL0GOyf4f+ivw0neTVpSqv2pqR
         h7CSwm640/35d7AecUmQDJBAkdFeUig7xIMIsAChwfRbB97OivJ0cktaJN1LdiZzyQ8A
         5JTg==
X-Forwarded-Encrypted: i=1; AL+hErG3o8yFC8Nd7e72jhmqINnCb07kiO+PFx0jswTQF28cOb2/HuxFjR3wVyPRFbt5BYwuNKjOOYQ2XCV1Zg6TDvC9@lists.infradead.org
X-Gm-Message-State: APuU4Z+rkQ6BbPDX/TXyBcQGNf2G5peJcvs6mr49ulmKVAZ7OYNe4Y6S
	nFXwd27M06onpeglnLdUl2J8kyhnoxOZGIQa97NY0kOsZOysd12tEhcA
X-Gm-Gg: AZFdTZcMT35hzMDCx+sLBHLrVmAYyTia6M9ElMx+3kHaJxrgRhIjmLLww1xsjRz48U8
	XkXO79S2GApOWFnYKqOCpRZZUTj88tUGXGkfQABy2ayQa2DNP2R/yGCiRrEmBz7GwdwFEeoHqOH
	wxRbbO8AdrpMpCrFBRv9uFfQr86WKS4ZWCE92xJJow4XR0y5SdZXTUfS4fO17tkYINgo6z3+5tv
	qawYfxnJkxVeOlhsWb/lHB/58hQdazcdctKa9giZWgVOitfSJuLYnh5kZ0t0IDg8XOgvW82IMBp
	72+zYzs+egY8XJ6S1U3tbpNM5FL9TvuG0MaZLWUDEmpwsOcu7rgRX7gdZhFHm4F7TkcJ0lwoYZd
	cQe5jAASu0oIoi+LRKRCLDHeXf3xN7IJ1COXiHoEScZisYazg2cyaXAlmSdH20oGZb0wlRnsHQt
	G1BVeFDMSt4ogxm9f3I5zNTOOSupYRth9dJkSUwIeECAxei23uxKhzBHPdVjO+uGTvKF8RYX0mV
	Hs+eYUNJli5fyXC51BiG07vyFAYicZQK9lOIt7zmDjkShDfiaPUAqttomGZ+BweN292fai08NJB
	y3X0foIDt25Pe2MhF8udHpmIjfYV62D/8Dcgle3Z5FpZ1D4cocVwmydO/B1XxmdBKQt4tKkGY2K
	hZSg3djzxAu+Wr6bzU244ouqU1uiXb2GIa3OLsVdL1G2VWYMQwntvgwvmuk4f/vDpmQJUYA+ajA
	XwRIOgRP84E7VdmY2Wv6F7JAsmJZFLkVCX7o/uSiu0K+hbRA7kAO9CBK6J/I6kihvA+BXGZepqG
	ESlTOqOcqkurFCJVM0ahx0IZztSQ3YinKKkffmgfw==
X-Received: by 2002:a05:600c:a087:b0:4bb:5c92:ce22 with SMTP id 5b1f17b1804b1-4bb887fe887mr443791125e9.8.1795717789172;
        Thu, 26 Nov 2026 10:29:49 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42382159f8f.41.2026.11.26.10.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:29:48 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 0/3] mmc: sunxi: preparation for A523 UHS support
Date: Thu, 26 Nov 2026 19:29:41 +0100
Message-ID: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_102951_974066_6A770614 
X-CRM114-Status: GOOD (  10.63  )
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

This series paves the way for SD card UHS-I support on the A523, which
will follow in a later series together with the A523 clock phases,
delay-chain tuning and the PF bank supply switch.

It improves the DMA setup and error reporting, which the UHS-I work
builds upon: a DMA mask matching the shifted IDMA addresses, IDMA
descriptors built from the mapped DMA segments as the DMA API requires,
and CRC errors reported as -EILSEQ instead of -ETIMEDOUT, so the MMC
core can request retuning.

Tested on H3, H6 and H616 SoCs, on multiple boards, including Tanix TX6
and OrangePi Plus2E.

Changes in v2:
- dropped patch 1, applied to mmc fixes
- rebased on mmc next, which now contains the probe error path fix
  the DMA mask patch depended on
- Link to v1: https://lore.kernel.org/r/20261103183030.81078-1-jernej.skrabec@gmail.com

Best regards,
Jernej

Jernej Skrabec (3):
  mmc: sunxi: Set the IDMA DMA mask
  mmc: sunxi: Build IDMA descriptors from mapped SG list
  mmc: sunxi: Distinguish CRC and timeout errors

 drivers/mmc/host/sunxi-mmc.c | 116 +++++++++++++++++++++++------------
 1 file changed, 77 insertions(+), 39 deletions(-)


base-commit: 299ac25f5af7cbba27d80e4eaa8f9c703c96b2dc
-- 
2.43.0



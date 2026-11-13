Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0322F606A880
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QFiBElpH;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LyRs6kPv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6cKcdP6ZFsbUpqGoJa0cKoc76Hw0duCjesAc2W0YCc0=; b=QFiBElpHnXpEY1
	VVRFrd5hJy7D1fryuthwsYqrjNYwl+LgMjEyQXSEfdXQLV2htnF58BYZMReDFoB1XsTmc1NI6f5cx
	jNS//c5QqyFN1ahjk7Grd09qVOS1fGfy3CEts4O/ZhI1IXh72bYDXQXyklpOYkRAaljFQZp0HRiyN
	8wKk/kEeytDrd6iMdrORVxBx5NO8ke/KdhXFnqFtNeocJXe2/CsBst2cmIejX3Ex8fMqK6eOAtu4s
	hrFVMvRqShYNCx+Vn658SrE75rHMny67fxQg3vuxMbYW2W6mE1B1jBu0cPejVQI0RSIXsrd2OCczn
	PaNZM/lfa6t0SzoRDCwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxzW-0000000ER7v-0vHS;
	Fri, 13 Nov 2026 20:35:22 +0000
Received: from mail-oi2-x0b.google.com ([2607:f8b0:4864:32::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxzO-0000000ER1q-2WxQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 20:35:16 +0000
Received: by mail-oi2-x0b.google.com with SMTP id 5614622812f47-539d2baa897so505670b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 12:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602113; x=1795206913; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6cKcdP6ZFsbUpqGoJa0cKoc76Hw0duCjesAc2W0YCc0=;
        b=LyRs6kPvtSIUGgAa39N9aOuOimmS8wJslshu5NdVde3aROvX7/SiFc86gGHSNmSAWd
         LkonCMGRl+CjgJXOZBnfA4O111agfoJ+Iz607+8Ba88RJV/lyMP+gHGmHvzB0f1rtltO
         BNnBsm7QKPO6Md/TlkVg8ANW76cMpG2bVEzV95q6grrr0dll5nchbYMe43tlrs42zQ1x
         50PW9RLmVeLoE1I0yC+MgPg9jAUhGFZFioUpI2uOKviy22zFiA2rLWxOh8VVAFN6iDvw
         wBECDuRjSxI17TP6EIlJPEjI33VlvT8yJYGuhaf3nICZZ8LW8IAaiwqwFGCGnK+SACeg
         7pUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602113; x=1795206913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6cKcdP6ZFsbUpqGoJa0cKoc76Hw0duCjesAc2W0YCc0=;
        b=uHP1Jmrk0k3fuSiBVZEHeQhEM0Y3i1EVDfxmZlTT6vtE1fTAWID1kxdcxYKrAM9F5p
         uk/WXIZGC0EwwL/Vzpj/8Gn99vKD2HPb7lHI5NTpFNPHNTipBh60Np7mSA+HTnDnbpwH
         O4zye7Nej68n+W74kmBVCDxDL5vWLE53f29pspaD7K+XriDuvH53gL7GHhzKetcTcDm2
         LBsEQtheiIpeoFbTqOH14YxLP/c4KEfv9FgCmH/EscLYZryvMsb/G9ayLqufWyXxiM+f
         XsT8b/yQHXb2WsOT88OPWzWxSGGRW6RUHdHjBZAdki0PwIEp/srHSLeshsYJEIUsoiEm
         Lhfg==
X-Forwarded-Encrypted: i=1; AL+hErGNK5Gt0qoSiLoTOOCYpbGUkIpxCxW9Bg+5GRv+U6ffzLrb4FE6ylwktuCPv3XiBmq1/ppuuO1RTGsQh9rIHmsd@lists.infradead.org
X-Gm-Message-State: APuU4Z9soeBkKiiiY6vCvLQr6P9j9PKzC7/pjxxEi0mCjka59FGm5h7n
	DViFIu4oFTLzjh6XmQCqVLnsB2sMXE+gXxSUsUNkX37GM9T9Riv9Dznn
X-Gm-Gg: AYBFou2mr7RlGzFQ0iEPaq56iLb7ITQd7cPiFtW8ResR9EuLcMDRmOioeGNeXevDax/
	H9rinOOXj0YxiPrx4MqCVXfSTeKqDu9bWTtmaeRUC4EoZ2GWzcSErHGm0gDpZHpFqNPvFbY2AV3
	UBPwl23iIbwBBfb+9vdpVXcE0LVKlFZ82gZXwGZCIPgVCMIIPxLD2yDbV5IV1E+5QWGlB6c4Zqg
	p+EJZGcOJdEjqv64wu2/DmKN2URVYkWuwcaxEAhv/s0NaZt1KmnPZ24H3hOVmVt9/lq//5nu+IX
	zazXkSI25s3VPjWdHWsPDrdlNY6RzPtP0QmAwafE9QRQvosS2A3SrQpYW7tsMPPSgd8aKbRgyFf
	d1ppxfr5sOxfMs4cjCFgxBDqUkJ7XDF1XQz1n6el83LbYZ2K5HL0KNQ4+ejlaWI8RfGnj+hVOpu
	ykT/7XJazjuUjcHqIR4QHh+qCqjDJ//pbFyXJCVZbrjyF3KYS6971jTAIBcJvRv98Ygbhc+WH08
	94zOUG4kBleRxjWZxzbmxuqg69aDDPSQnZKCqh01wZi1jOifEiu3mtLoY+rT2sKyehsCRV9528S
	jJpAnEATPULoUjpROb4nYmWmYuNAz9srhkcrpBm8gea54vojBKcIH2efp9/3YQX3NyRKSJwV9Lh
	DdDcWKFScLfZ1UEYu/8s=
X-Received: by 2002:a05:6808:10cd:b0:4ed:7045:d3bc with SMTP id 5614622812f47-56e641d6c13mr3204181b6e.32.1794602113421;
        Fri, 13 Nov 2026 12:35:13 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm2712225b6e.13.2026.11.13.12.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:35:13 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 13 Nov 2026 14:34:55 -0600
Subject: [PATCH RESEND 1/2] clk: mediatek: mt8173: fix the FHCTL DDS mask
 width
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-mt8173-fix-dds-mask-width-v1-1-c8d1e3288df9@gmail.com>
References: <20261113-mt8173-fix-dds-mask-width-v1-0-c8d1e3288df9@gmail.com>
In-Reply-To: <20261113-mt8173-fix-dds-mask-width-v1-0-c8d1e3288df9@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794602109; l=1762;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=+CADWjqc22AUSeVeKeNbBWk6vnVbnoxXOpZ/q/waG+w=;
 b=iLQXE6+fT67k/1+QXFmsj0CBbRIh+BBShAboAlWwKdNv6JETp70VldtQbm1fwLYVRqDFJsRNd
 EbaohlTqIw/A4R5rO4Jb0oapwZN+1s1+IeGmBrmEnDmvq7F1aGrFtC+
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_123515_276970_F74E4FFA 
X-CRM114-Status: GOOD (  14.17  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MT8173's hoppable PLLs have pcwbits = 21, so the FHCTL DDS field is bits
20:0, but FH() declares .dds_mask = GENMASK(21, 0). Bit 21 of FHCTL_MON is
a status bit that comes up once a hop has settled, and new_dds from
mtk_pll_calc_values() is always 21-bit, so the poll in hopping_hw_flow()
never matches and every hop runs to the 1000 us timeout. The PLL does reach
the requested rate and clk_change_rate() discards the error, so the cost is
1 ms of atomic polling plus a warning and a register dump on each rate
change.

Six MMPLL rate changes on an Amazon Fire HD 10 (2017) all time out with
GENMASK(21, 0), MON reading the requested DDS with bit 21 set, and all pass
with GENMASK(20, 0).

mt8186, mt8192 and mt8195 share the constant but are correct, as their
hoppable PLLs really are 22-bit. mt6795 is fixed in the next patch.

Fixes: 45a5cbe05d1f ("clk: mediatek: mt8173: Add support for frequency hopping through FHCTL")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..327240cd34fb 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -100,7 +100,7 @@ enum fh_pll_id {
 			.fh_id = _fhid,					\
 			.fh_ver = FHCTL_PLLFH_V1,			\
 			.fhx_offset = _offset,				\
-			.dds_mask = GENMASK(21, 0),			\
+			.dds_mask = GENMASK(20, 0),			\
 			.slope0_value = 0x6003c97,			\
 			.slope1_value = 0x6003c97,			\
 			.sfstrx_en = BIT(2),				\

-- 
2.56.0



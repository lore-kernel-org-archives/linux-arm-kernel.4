Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC51D606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L3YJ+rr3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=smMirqfD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kW55Dk+yseJmN9okamfVtjuiC2NhjKfzRVvzdrDCbhA=; b=L3YJ+rr3ngAqJypWsGClJYyRrt
	S5ZRk4Ftdn60VdEkljW24GBbAbHEveuZccaA0CXd7nF72MbbvbhV+UbuhzCyrv4NTeIu2eeAxNWFq
	ZzOWBib8HYNzWthDBniKYp7DsS+oRq2gYDDZhfLWPBrrTy5dZGW5XPBAi76n9nam5rD8rEdqqohoC
	7FPfxy6yCHWBZRA49SO9CaqJ57+ejm8EEgnart4G6hQkLg2V5LEMc/3rfMLyjGYWLtFde5lsPRQCK
	7AZCIh2lUaibBvvX6QaECo6xY4lFSv142V1tYe7I2BkrZZNwBp58GTrUmTsd0rKvhgSR4MbxsX8tC
	UiOFXAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMXl-00000006Uce-2Imt;
	Tue, 17 Nov 2026 17:00:29 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMXi-00000006Ubq-3zrs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:00:28 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-89d3a4c9fe6so1406b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794934825; x=1795539625; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kW55Dk+yseJmN9okamfVtjuiC2NhjKfzRVvzdrDCbhA=;
        b=smMirqfDr57kiuT7fcWvg9xUnDWxnV9bvBuXxjEmZY9HeWsf9m8JHskkQYiqbAespa
         zHjH1JWWXfq1D2o+O9wWbnl/wQz5/bu03Yj7Pjdwg83L/kdlaByVHsEvlva+Rmi8HFWX
         yQfhGSrzISbaue923TdZIFOtmu+larGmSnR6Fmeq+rSo/b9qwxGu4V+bQ92hkMKMu8QC
         qhRns5s9ICRKLO37K5KcExWXaH0EfquycNasW6NE5hkjXmqC4OCJUpECPLTFhcXX0s1/
         i49NFffZI1HTJnx1PrVWQhKnVaywbnlUWbiqHG5jQtit+mqAEtiMgvCmTmOiTiRSoPpn
         /BZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794934825; x=1795539625;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kW55Dk+yseJmN9okamfVtjuiC2NhjKfzRVvzdrDCbhA=;
        b=V4TSnH7dMrdCX0dBQYtHz4r391hsp1JMjFoHC/XJZQkxt5QWbn3alXwC2kSvc4CQMC
         XksOOH5/pYz+aRLlSyT00ixrsdnRz8sI0xUoFzFCHRXuYKukqdfXJFWLLeBOhm/gIkw0
         kz/z4wNqpNlTOLxFxI4ZO3a3/QSDPqdEye3ay3k9c7+k1uRutt2EZn4BZeeu1pGxGUcN
         NZ/iPIw7EqkR28WiQ+IKqrK+yOLJoIOCT9PpSg2LyQU85nmeFW4mKScfb5o1GVx8/LZx
         LY7nn6+ewOhOXHu/dz3yGRBKqQem4WX0xTObXE7pkj+8VFXIVP9tH9uZM9/vXE1cxbqJ
         NhqA==
X-Forwarded-Encrypted: i=1; AL+hErF1M4ZnVkcj3kccJFV4TlHxgM6jRiHQoc1t+cF+ccULae9dcMpFoXBBy5U+1Kw41TGUTcrFcTtPOBkz0HmRoLGv@lists.infradead.org
X-Gm-Message-State: APuU4Z94htOMu93snTZvpCdkSAmxBXzJyKHqeOfWmKyNDcPdKfaZ/rVI
	ugeXCVF50SvhwTy1wWV3bj6JHlKtw8XXV/YAodq2L2cYm/3so5ePp4iN
X-Gm-Gg: AZFdTZf7COeuoj+L4DgQ0piWZlNqwgjZ8CQ+i//aWDII2vZyAtuhwpHEwmm2jCmvZhK
	EVDxTS1dpqdmMeeeFMIieHmAtKJOxpn0QKovhrupZ5Dy46c+nCsphGSRZmFN/gv+rs9rYlLpZdv
	JQW86+8kbv2Wk0RO/MYyZP6VT+PuwkHr/P6O0xOrpgklbUOVSMQsbZgm/p6cjhsDgduI9bqRpHI
	nQxsiJKE+ci+x5VvqXp0WyQpZdgl6eN8fY3Sc2Pg/S8jlvDoF8TsrH90sHfo3eqQfK1l3L1b3Vg
	AmSB1ChVByPKJn/Hh6S9myD9TcWccJfQeR7QoK7CZcRuZk6FnXX8iB124z6eW1UDQaXRS3AqS1D
	Cqz/K1Ly9oH20IQ1mt395qUnLKMu1R+rNfDaBs6ZGXZgfD+rgaAiQg8LIVfDqli94uknP1hANr3
	hmYGiuYbsgfQDinAoiQroyEwmvlbYwjs/L+SRljdQAcP8Ot0EPpMBRamYaWNihwNDKzc710U8KD
	szFR+Jyo1FZ3er00Sj7EmM3RAJaclkFQAwDu6/rnQ3a+HDfy28Bzy2BpI48yXX8SuOAjyfWpRoJ
	6ZeZdKMdUTV9FLYd+xJiHJxxKOyQRkR0+Bev+W+QN4W+zkWiC9ZKELL/mK9hvJyowHfasw==
X-Received: by 2002:a17:90b:1d47:b0:3b0:975b:2256 with SMTP id 98e67ed59e1d1-3b3d07a8e0fmr40970a91.4.1794934825267;
        Tue, 17 Nov 2026 09:00:25 -0800 (PST)
Received: from lima-buntos-dev.. ([218.239.109.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abe8b263sm5183964a91.13.2026.11.17.09.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:00:24 -0800 (PST)
From: =?UTF-8?q?GIBEOM=20LEE=20=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH] soc: mediatek: mtk-dvfsrc: Add missing calc_dram_bw callback for MT6893
Date: Wed, 18 Nov 2026 01:57:17 +0900
Message-ID: <20261117165717.1348-1-rtx4060@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_090027_001774_98823497 
X-CRM114-Status: GOOD (  21.64  )
X-Spam-Score: -1.9 (-)
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

Commit ddb5862a43b1 ("soc: mediatek: mtk-dvfsrc: Add a new callback for
calc_dram_bw") made __dvfsrc_set_dram_bw_v1() call the calc_dram_bw
callback of the SoC data without checking it, and set that callback for
MT8183 and MT8195. The MT6893 data use the same bandwidth setters, but
were left without the callback.

Any bandwidth request for MT6893 (MTK_DVFSRC_CMD_BW, MTK_DVFSRC_CMD_PEAK_BW
or MTK_DVFSRC_CMD_HRT_BW) therefore calls a NULL function pointer.

Nothing in the tree sends such a request for MT6893 today: they come from
the EMI interconnect driver, which has no data for this SoC, and there is
no MT6893 device tree yet.

Set the callback to dvfsrc_calc_dram_bw_v1(), as for MT8195, which has
the same registers and bandwidth limits.

Claude, an AI coding assistant, found this while reading the driver to
add another SoC.

Fixes: ddb5862a43b1 ("soc: mediatek: mtk-dvfsrc: Add a new callback for calc_dram_bw")
Signed-off-by: GIBEOM LEE (이기범) <rtx4060@gmail.com>
---
The MediaTek for-next branch and linux-next (next-20261116) have the
same lines.

Testing: this has not run on hardware, as I have no MT6893 board. It
builds with W=1 at the base commit below. mtk-dvfsrc.c also ran
unchanged in user space, with the registers as a plain array and with
ASan and UBSan: mtk_dvfsrc_send_request() was called with each of the
three bandwidth commands for every SoC in the match table. Before the
patch the three MT6893 calls jump to address 0 from
dvfsrc_set_dram_bw_v1() and its two siblings; after it they write the
same values as on MT8195 (20 for 2 Gbit/s) to 0x26c, 0x278 and 0x290.
The other SoCs give the same results before and after.

That model only shows the call path; it says nothing about the hardware.

How this was made: Claude (claude-fable-5-2, an AI coding assistant)
found this during a longer session of porting mainline Linux to a Lenovo
TB375FC tablet (MT6897), while reading this driver. It wrote the patch
and this message, and it ran the checks above. I reviewed the result
before signing off.

 drivers/soc/mediatek/mtk-dvfsrc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
index c691a895c92c..8ae924bb81c3 100644
--- a/drivers/soc/mediatek/mtk-dvfsrc.c
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -736,6 +736,7 @@ static const struct dvfsrc_opp_desc dvfsrc_opp_mt6893_desc[] = {
 static const struct dvfsrc_soc_data mt6893_data = {
 	.opps_desc = dvfsrc_opp_mt6893_desc,
 	.regs = dvfsrc_mt8195_regs,
+	.calc_dram_bw = dvfsrc_calc_dram_bw_v1,
 	.get_target_level = dvfsrc_get_target_level_v2,
 	.get_current_level = dvfsrc_get_current_level_v2,
 	.get_vcore_level = dvfsrc_get_vcore_level_v2,

base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4


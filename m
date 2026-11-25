Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D26606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w8VGjvzi;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxqr2Oxf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RSZOWxfqWDFwRdZgOArsmxSLz/YxCgw0M+/5x+1CQb0=; b=w8VGjvziEErzsZ
	DX6Me0DQMqcJfEPlp+d/Q8ZMGJPNKAabpIgmui2a4Wg/emqpiH0z2TDS8kYL9IhHiCKgPne6895St
	i2KplM3iCPeIJcv7cSuO0O4eW9cWz5+t+7FFlyB8cOHN6ljSm6mY/NtZhQI11JtJp5ypGV+XfUWjt
	Zv/C+AxqNyiKjfDuR9LSxmwbCME7JYIS4x8mQ44ZTot+8WOWXXUNQxLCsHc874ju483Br2QasNgSq
	3ccrT0ChAP3w4NKvuRAAhARfuc4CwElZ5DavSnj1gTHTDP7gYQFXuYd5Qii3iOrqAbr+f7g4Zi/RI
	1H7RLQ9TAdoT0N6e0M5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7JG-00000008qDE-1ZpI;
	Wed, 25 Nov 2026 07:20:54 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7JB-00000008qAh-0IvU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:20:50 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-3282db206d3so5044801eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591248; x=1796196048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSZOWxfqWDFwRdZgOArsmxSLz/YxCgw0M+/5x+1CQb0=;
        b=yxqr2OxfbVSyxHi7YzQmslLP4q7phOKmQxa3ujHGMwdL2C7QwpT1wsxQ6LvNamwVEF
         5GAnO8SIfwFyxB1IUouC41hyicEAfrelqfCziflTrEMsdo3UMJXdVrrUB0bMpgrIcIkA
         qrLYu8eKR8g9oDjk8A4yHzKixaQFWs7A3hsEGlCK9wtqq9A1AF45oKO9R5HSm5QvcbHy
         2tpDnW/37oxaGUjNW1R3JzYeBk2RDJF4yKDqICbkgvgvtzPyt9Nzp+1HZtl+x9WNonKI
         TMeDzXL7mwahrlgXifwG1/PggWCXY+H+mMHRzFB+3C1hUTpdk2jabQAPisfRq1qTOFaJ
         pHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591248; x=1796196048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSZOWxfqWDFwRdZgOArsmxSLz/YxCgw0M+/5x+1CQb0=;
        b=ZTo3aTRrhvd+0JSNtmlevgnhXX3vFCcCnNAOmZi+E44vWX/ytX1PK6cNUqwCZ7HToq
         6bf1g6UueKyPcROckGpE0wzBpxxtXy/sjCHPvdaBS4oaoTraOh+cMcOffP6ZaGROldEx
         LpuT4libMeQiLfE0SVQ5bnPNFx9F8FQrX8+e2cmWsgIMu2Mq6CRc07Bk8oda9CQlCepR
         1NmgTfGlZjWo5q2sPZh47T/NBi9cQ1YZD7tJIf4zJdqr5h6e2gv1oPD10dLcjcdKzLr6
         /h23IdgrfSQE8mr3Ws1S8fJljpI8TIX5eulofldbtHTTbJhD9gb92v/IXc9kt0EaK66i
         mYkw==
X-Forwarded-Encrypted: i=1; AL+hErFmU8bo8EqJ7U7ms5ZdQRR20MGsWjgxJ1Ie2lNe5VcmmaZLGRBINoJHaVnoiAv4RhvClC8BhOvaNsAI/FZzr8BU@lists.infradead.org
X-Gm-Message-State: APuU4Z/EGf7LmWUVyJckDq06egUq+MMcIK7b1855UEAKQhD0tt3wAsN1
	rdakqltcw7MS5ImZIO4TPWCU6U++BQq+id3jEAKTQiHU+8ZWbUWeVKac
X-Gm-Gg: AZFdTZf8ieBU89P4hqhAc/3MNGZRSD2G9I2Cz28sKrBmJADv9mvOfBPDGjJEfCrghKg
	DQQj+iOVMaQ0lOOvretiF2z+6YbDVN9FCDwv0WarRAcjUG7VjJBid6KdHHdhe1EJrTdiPGG9jsQ
	i21rOkzqPj/CuMpnwBEn3K+8rTiLb99LceUyDkW+lj/SiamVWZdmfhbiN2c7pOI/eSu6zyNezv/
	GZSb3QE78yD2sGzJ31wEw07lBQwXXl722Y5z0btIe+nS7C3P4sSktZmqt67toYl5zSbEAh2jeIi
	bc3WkwGVEqLhmUAHHY+yO1BIXi6RBi3OgmRsl1L9YU22h5wdOFMQHt34CKSKU+YN7MmmMDK4Cj6
	efr1nr0736q/MvVXRzo+wtoZRCvda9gm8sABcWbXxgs3Z+rpPJhkdg5J/9aeM05AkKdXT/pSds0
	pAQntrrT2hHLdmz2EyvRRu/x8vFaOw37XOtwtiMAU5poKlZoYC+8TCjBiaZl05Ip9LFfwnTR0jd
	/w900cBhwtggtCCcHYWCgretFfH63DoA7YfFbYeY8XqDHscLsaM5WVZZ5oQ2RPD6acDnm5xyPnD
	WbjmVNUgtoygj4tZIr/yekBIceyN/iNAC5o5AAf+DOTBQTgdT7MIxHb1Bt4UoKTr
X-Received: by 2002:a05:693c:8951:10b0:386:b4a1:d92a with SMTP id 5a478bee46e88-386b4a1daa3mr7689219eec.1.1795591247853;
        Tue, 24 Nov 2026 23:20:47 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:47 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
X-Google-Original-From: Prasanth R <prasanth.r@lineo.co.jp>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Paul Cercueil <paul@crapouillou.net>,
	CL Wang <cl634@andestech.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Prasanth R <ragaprasanth@gmail.com>,
	Prasanth R <prasanth.r@lineo.co.jp>
Subject: [PATCH 03/12] rtc: mxc_v2: fix unbalanced clock disable on remove
Date: Wed, 25 Nov 2026 16:20:17 +0900
Message-Id: <20261125072026.2997493-4-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_232049_123515_E1763A75 
X-CRM114-Status: GOOD (  14.00  )
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

From: Prasanth R <ragaprasanth@gmail.com>

Probe leaves the clock prepared but disabled, and the RTC callbacks
enable it only around register accesses. mxc_rtc_remove() still calls
clk_disable_unprepare(), so the clock is disabled once more than it was
enabled and the clock core warns "already disabled".

Only unprepare the clock in remove, as the probe error paths after
clk_disable() already do.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: 83c880f79e88 ("rtc: add mxc driver for i.MX53 SRTC")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-mxc_v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mxc_v2.c b/drivers/rtc/rtc-mxc_v2.c
index 965170bb8..35a18b75c 100644
--- a/drivers/rtc/rtc-mxc_v2.c
+++ b/drivers/rtc/rtc-mxc_v2.c
@@ -365,7 +365,7 @@ static void mxc_rtc_remove(struct platform_device *pdev)
 {
 	struct mxc_rtc_data *pdata = platform_get_drvdata(pdev);
 
-	clk_disable_unprepare(pdata->clk);
+	clk_unprepare(pdata->clk);
 }
 
 static const struct of_device_id mxc_ids[] = {
-- 
2.43.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2B4606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 06:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z+T8Rrjt;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=06UAD8it
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LHL2l3rOn22wCea5M4iQzvY4HHhth4DONcB31HGYom0=; b=Z+T8RrjtEiRteyjbzdZoZ0Mj4l
	t07YUxr34O7Ddd/5ilG40SVUC4Hhj6doPqPV6mi6oqfJgDjhk/RM5P2K337ptQuD0ze2CAGZsoS4C
	Ejlr8Qfv7xqj7YNYbfVSmcgGdkUPWiETqP2p+5IeUjMbmCqp6EoVUkFlFm9eUzwYNss8w/px1CA5I
	tyApKZHpN/583wbrAiPc7lyPNtezWKCys+LG3Vq4pj8LSYRGQxv2VGePAETKkCVGnQGUNMKr0Y5No
	2WWXUyqFb/lpgRDSKN7AHMMmEM3MK0R3xvbzPVQbQDSQ78Ntzr6WuAzCPdepCKz84AYw2sF39NHA9
	pG/tHRig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPa3X-0000000EHEI-17Fw;
	Sat, 07 Nov 2026 06:37:39 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPa3V-0000000EHDu-117U
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 06:37:38 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so5660605ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 22:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794033456; x=1794638256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LHL2l3rOn22wCea5M4iQzvY4HHhth4DONcB31HGYom0=;
        b=06UAD8itoV0tKiGaMWg8IUCLtMD72/Bdk1rO2ORdYAo7g1ACgzJdN0X9l6e75LjrEa
         7G4npgNELaF1U0x6mxoNEamzrcOZ1Vn/yXAraFUPYzyOqeQqh/655IJgm/VS8gkMmp7h
         ZgbQJyj0g/2e2c/u5hIRqGW8566MnXx6W0F/0licrLeYcvtYjpV1F5Ow9mYpjBG2bKc7
         OM0slI5Tp05TeOK7O1Y617N5EfNfxTkDSfNrnWkzUQ7uXUQk7+OB1Ssz/oJu7CVh8N87
         B72HKV1uPeLlGy5uh5KTav0lnyB2vqLeiCJx+dbrJjYbzHw85rUg7ru/u6n4gUaTg0Ji
         vQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794033456; x=1794638256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHL2l3rOn22wCea5M4iQzvY4HHhth4DONcB31HGYom0=;
        b=OsKdxJBNfdkoYZ6nq56ldUWnXoajNd83/f8OHt6H46v+bJgqKOsYCz9yQwiZyexj1m
         1zJqxAfzAMMXu9LYIY13dIXmG5FN3oPOaLfdB1iCeHrhbxJWAMn7Oe/D04vJmwyJ5jbu
         pGrbbZI3VtIq4JqTpI8lPhyv/RjCVNkTDWYKJZ4OAgeD8l7s055X49ZgnJiFohiOO05f
         UMbuP6QXPOusbnDUjP9EtMcr6htzgx6RCQOu/LEOOkOdI3copT4BdcSE1LoCR1MI/Psd
         p4Bi3mp9Us1xV3mAv7gTcJ7Y2pHytgs6XPDPMLed4Y7NB/n6Cg2N2U8K89v476WeCKQ4
         bAOA==
X-Forwarded-Encrypted: i=1; AL+hErEZh28LbJFjYsuv0UnY88oCOA/ofKt2r7gv3LuY/cVMm/x5dcIGSgUoBvAgl5fUtivjOZ8ZN+C0Uf7jrH00aAYn@lists.infradead.org
X-Gm-Message-State: APuU4Z9v+0iJt7H4VkzgvcfDvs/kU0NUU1ukzV0KI9sjLldc7Fzf7GDY
	T+uOKTP7IJ91gSsZUFAYfqFP0Ho4VRJ/7NQsyrXoWlzm+cxoaeWgfbDo
X-Gm-Gg: AYBFou3rbZAWEoC0d01EPrMtnckvMfoFtOl3q/OoiS2xJOVlmGkHz8SgSPCon6BwXXa
	Q1zeP7HnSP2N1VrcoBOAdQeOT9lWwO/98zPwoTbx5nUHNCB21D/CvXoVAtbwycScOJw/1FaFhUE
	2q+B81fqcEfncWtW+6/+zw+9fj2Lh079jFERTWlS6j//Ds4AFh9nrjOuyKoBMNo+jHLlI6xQvy/
	zotJOZKZnNqmXDJ8cUbOC3hD9JFHG/Gs59z2tDqxPlZssr9xDczGUWBwx3ezzVu8MhlpWzhkXtj
	ioDOxWTkS6rUS9hk9qnKb4Wy4V3V8jzXrpRsWxI9XvflzjvTZLb7OuQljNeV2s0Jj/ZwYqdIfLD
	liqNUCZ0mJfALN/ndyUYbFpU0QjNryu3JO7EkUml7wSOT24GI3R2R8x4aoOASavz0ae+HFya5VP
	fgR1tgQnlIKlYQyw0Rj0zrEgOqKJSjeufve4biQ0nVPw8nCzgfixPbcBw2FQBAswBdCbf6UWYom
	N/u0ImJ4ok7wd+/eInl/VGbd5/Nl35n4oans1WHgJxEwQYDWRvqsB72T4qPVliSvTggtTKO6w3R
	HmB5TE7Cblkl0Z1luRTlbINOXWnxI57xRTLLZ3G1+fnmpKrJ
X-Received: by 2002:a17:902:c403:b0:2ed:892:584b with SMTP id d9443c01a7336-2ed40c4950cmr61777055ad.32.1794033456039;
        Fri, 06 Nov 2026 22:37:36 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed477a9301sm11315185ad.23.2026.11.06.22.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:37:35 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: MD Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] net: ti: icss-iep: fix deadlock when disabling PPS
Date: Sat,  7 Nov 2026 15:37:26 +0900
Message-ID: <20261107063726.3388730-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_223737_311922_E93F7145 
X-CRM114-Status: GOOD (  15.61  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Hyunjung Ko <hj351016@gmail.com>

icss_iep_pps_enable() holds iep->ptp_clk_mutex across the whole function.
When PPS is being disabled it calls cancel_work_sync(&iep->work) while that
mutex is still held.

The work handler, icss_iep_cap_cmp_work(), acquires iep->ptp_clk_mutex at
its start. The capture-compare IRQ (icss_iep_cap_cmp_irq) schedules this
work on every CMP1 event while PPS is enabled, so a handler instance can be
running when userspace disables PPS. In that case cancel_work_sync() blocks
waiting for the handler to finish while holding ptp_clk_mutex, and the
handler blocks trying to acquire the same ptp_clk_mutex -> deadlock.
lockdep reports this as a possible circular locking dependency between
the work and ptp_clk_mutex.

Unlike a teardown path, the capture-compare IRQ is not disabled here, so
the race is reachable at runtime simply by toggling PPS off while the
hardware is generating CMP events.

Drain the work only after dropping ptp_clk_mutex. The hardware compare is
already disabled by icss_iep_perout_enable_hw() before the drain, so no new
work can be scheduled once the mutex is released.

Fixes: f18ad402cd8b ("net: ti: icss-iep: Enable compare events")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
---
 drivers/net/ethernet/ti/icssg/icss_iep.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
index ec08589..6264061 100644
--- a/drivers/net/ethernet/ti/icssg/icss_iep.c
+++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
@@ -579,6 +579,7 @@ static int icss_iep_pps_enable(struct icss_iep *iep, int on)
 {
 	struct ptp_clock_request rq;
 	struct timespec64 ts;
+	bool drain_work = false;
 	int ret = 0;
 	u64 ns;
 
@@ -607,7 +608,7 @@ static int icss_iep_pps_enable(struct icss_iep *iep, int on)
 	} else {
 		ret = icss_iep_perout_enable_hw(iep, &rq.perout, on);
 		if (iep->cap_cmp_irq)
-			cancel_work_sync(&iep->work);
+			drain_work = true;
 	}
 
 	if (!ret)
@@ -616,6 +617,15 @@ static int icss_iep_pps_enable(struct icss_iep *iep, int on)
 exit:
 	mutex_unlock(&iep->ptp_clk_mutex);
 
+	/*
+	 * Drain the capture-compare work only after dropping ptp_clk_mutex.
+	 * icss_iep_cap_cmp_work() acquires ptp_clk_mutex itself, so calling
+	 * cancel_work_sync() while the mutex is held deadlocks when a handler
+	 * instance is already running and waiting for that same mutex.
+	 */
+	if (drain_work)
+		cancel_work_sync(&iep->work);
+
 	return ret;
 }
 
-- 
2.43.0



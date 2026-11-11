Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9479E606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 09:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qUPPjmCL;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cKC7hwmo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LSFCUV7l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UdG5oyTsW3SCo2JaVqWOt03kQFAtr2dh6inbjFjR3UM=; b=qUPPjmCLGhY0qdGRJkjCDqu0WO
	eKbXotuxKNgvBUw0DN4TMxIdp816h3NMMPX/E/GzUIxgDfthwhiE9tE6NFd1YvZOMCsYbvLymixco
	iulb9KnIM5z5IZONVgqD1dE7ktilxJde0m/fV8/wDQ7TB/MTBIPw8w+OtRX2CCuDSst22yX8190Ic
	86yVSnIVDsMNu3i2kazOGPs9mdz6+hybchKvuH8BTuJejqUQ05kp1ZoXpbX3PMqDvwsjzR/FRoklh
	wqM7KGuuEhW6bpZlRrrlFFpdIT5lMrWgemDZpR+i3qMjcoVYH+0/KkVUZ6GRk18n9tplsUBGqre1J
	+3fzMvSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR52Z-00000006GI8-0gWb;
	Wed, 11 Nov 2026 09:54:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR52W-00000006GHf-4B95
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 09:54:50 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KDLS863476
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 09:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UdG5oyTsW3SCo2JaVqWOt0
	3kQFAtr2dh6inbjFjR3UM=; b=cKC7hwmok2r4xo0UIntxu9OswXSJFTOIQpPgol
	FbH88e0jmx+GVS158ESiDX8wsRVBmr6sfy1K3t+qWRme+k1LKDryCrglucTVweO2
	WdH+bbwzs779A7JEXRvfoCTFZ8Cqo0Z3emqf8kTmKlTML12pVwaiZs+/tDAgHSL9
	rnwNTifXZb2JuenQu2267G3EMzECaF/ldhicKF6sZxVveazdRBfm0bvP8SOj37xB
	F1NteQbz/nWF7JxXBMvjjE9QxS+ZsN1W5NRnm1CtjO3GkVjfxMYMokOwT6xtvC4a
	mAhhS81dwVZTbg6ztTcLm1UjtkT1AG7HZ1Hq+DbjWCH70nvg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawhkkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 09:54:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f322ef7d3so693044285a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 01:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794390887; x=1794995687; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UdG5oyTsW3SCo2JaVqWOt03kQFAtr2dh6inbjFjR3UM=;
        b=LSFCUV7le4mfIGW0L8vfnhPeYBpIOrK445VGyEwBmUwBvr70CIrMZsPazE/J6h/fZN
         lbI/34zue6mD6mrMp+NYVCe7b6fBVzJsUVWtbkh3DU5gkjnmOauW4Ek+cunmMBBSdlx0
         a/HRM7vTrEAYp8xZYSBUUo79qLA4whsPmHZRYCMDbnVidvDOBzW7oyQH9tHuA4R7L52M
         tKJX14KscGALoXWeRUM+SiV7uZC5MRwHjo8ulT9O6G+lj3B5dbR/CDajGIiYh7XCZDbX
         DcIvro1NlZhqJ5vQcsy257Uu8DqeaGBaKyfN+wzTfQN+QfIGnwd8uZWu6KP1GAJkMhRw
         +CnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794390887; x=1794995687;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UdG5oyTsW3SCo2JaVqWOt03kQFAtr2dh6inbjFjR3UM=;
        b=A+EsxitAxCC/Lwh8gIqtMdCsNPHPst5E6zb4QJT7wmEpjA+A9CA4MmIzCfFzPc53V2
         FwX34/N+w2Z2TjDg7xQTCXTqzmg90L+7X9BwTSQFOHa3GLaKX/jAu9yvlvFgamUQr0+u
         8X/LkFEN6VpOEJW5r7D/z1bSP5uq5rrqiI/3s42ZoSojw4w52uX1yL38CWb+Ne9tOwbp
         Zfg0fpg0HXhd9yvnA2H7EJXCjfYbFbHbuEHlVHMStB8OeDCVHo5a12tqS59/hmZFLhBW
         jX7LXkncHXxit7c/FtmYF92/fGYRC11/8xkk82uNeOqAZR0c6nUMqTwrTLzD2xVrxbZN
         7nZA==
X-Forwarded-Encrypted: i=1; AL+hErFudOTB2qsenoYj/iBw2wqW1Hrlrk1SroBCT5iivrUjXRFaIsKgTQuzFo4iRTySjHHLX7KBPz1zSJfUCYjCYq5Y@lists.infradead.org
X-Gm-Message-State: APuU4Z8PG3v+FQIImCu9YU/V5NASw4KbEeprZnbeHZt784aWaxzgBjTc
	/+xImv2RsfKmeXmanjMRfNiGX+HuzV/rsXN6oFWNGXvvq+NyZF/4vBV6glMClto+Uspbb2GM7Kp
	vBwfjJRMZtWbfCgPEiyapVSoA4ALWUvoNPYdJG9XI96vIDLUOBNmGFVHHgGDunMwicYjJWq9PnL
	8X/Q==
X-Gm-Gg: AYBFou2ohsi/bTlcsL2lGpx9TCo+vP9usnFPd95OXJpt4/oJqgJF++kGIpLDjsjIDnf
	+AEHCuhlFNEa4h9bgO4v2yi4l9asc2imiqX5KVc3/KpKyIiUWnXoJ5s5ZZuCOR9HqhHm28z1GX2
	AzZSUGi89Br8vfEGRmEGN4BMDBxGaIM25SdbJCRJ8mOigsx+J+u90U4DUyF4vzXb9dQxlZn2tGa
	5/FctRcOmAmypPRq+fDSDkJLBJmx0ffh+vTVulgZ98lowAjD5aEs20voNP5N7jlbLpL6GwszNh8
	X5t0t8n5cVIAlDhr6xTqGqkF3hvVfdIpkjq/EvXJPKSQsuDc3PKepsLB2rnMZbK61cJ9Mk8gOZ8
	s7XXs9pN2BV5q0JskZSQ+EMPM9zdM0bKn/2Swf+Lz+yX1cd9KDeKE+5daKDsM+To=
X-Received: by 2002:a05:620a:4712:b0:947:7857:bb7c with SMTP id af79cd13be357-947affd2230mr285459885a.33.1794390887300;
        Wed, 11 Nov 2026 01:54:47 -0800 (PST)
X-Received: by 2002:a05:620a:4712:b0:947:7857:bb7c with SMTP id af79cd13be357-947affd2230mr285455985a.33.1794390886668;
        Wed, 11 Nov 2026 01:54:46 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba09509c74sm25782215e9.2.2026.11.11.01.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:54:45 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 10:54:27 +0100
Subject: [PATCH net] net: stmmac: re-base EST after PTP settime64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-stmmac_set_time-est_lock-v1-1-da1554f233e6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MwQqDMBAFf0X2bKCKmOKvlBJsfLFLTZTsIgXx3
 w3ObQ4zBwkyQ2ioDsrYWXhNRZq6Iv8d0wzDU3FqH23fFIxojKN3AnXKEQaibln9zwTbhc6jt8+
 PpZJvGYH/9/pFCUrv87wAsbkWbG8AAAA=
X-Change-ID: 20261111-stmmac_set_time-est_lock-f74f4ce678b7
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzOSBTYWx0ZWRfX5MOuDgbLtbDB
 bc/j0FpEp/l+YQdjxz9RgxdpHJ9VDz2SLzQ3ECxUpTIxb2gaFhySsm3KgiM6qxJReJVUxgacj3H
 Eq148a+ajrIhzEq3G/kH//3vS5+Hw20=
X-Proofpoint-ORIG-GUID: sBrAcexrOYk7mt_J1tBB3f-HjQ_zAGRg
X-Proofpoint-GUID: sBrAcexrOYk7mt_J1tBB3f-HjQ_zAGRg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzOSBTYWx0ZWRfX4LB5x8EU6n6s
 wbkWsPKNA1HUj9wRPJFnWRcT6sga/eJmqhYIljr/HStlMmklfdAAfSORhhRju1BRDNR7cItHx0c
 yueYm4CFSE8X4SQBOGiJvQpZy3KrSwh9uwpKCzA2mnnXs1vD6zmJK5ofiEMQTWH6VFs2N19DeVR
 WfiTUsbaYSIqRnu9Au6e0KPoPPu0BQtAuPwUz0V71R2WwV1ULoujUJsesJTRWlWl+6pXEIdSUUx
 z1cV0ZzZve9ByZYKj0H5v6TJZiVYtYJKD/DP2KBV1cTYa2SM4VIN4AjwmJmKgHmmduamijuZ9xO
 T7Y63vS6hDQq2ghMyDCKcAVRMoNd9OchDu8NS9Y6tTua07egYG7lg3U/VopAltZ4dVTEAykM78Y
 mQfEvnPbyGifwLhL1D53loDdhgbVYgntMGArpvUjt9craXVAKUK81LttAD30mmiJLMtv/s/65JD
 37XHzexdJH43DcTVySA==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af43b68 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_-cRevXDmKoCW8SLZQYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_015449_126267_988FC098 
X-CRM114-Status: GOOD (  14.83  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

stmmac_set_time() initializes the PTP clock through
stmmac_init_systime() (TSINIT) while holding only ptp_lock.  It neither
takes est_lock nor disables and re-bases EST around the step, unlike
stmmac_adjust_time(), which performs TSUPDT through
stmmac_adjust_systime() under est_lock.

Both operations change the PHC system time, so both invalidate the
absolute EST base time.  With settime64, a concurrent
tc_taprio_configure() can read the pre-step clock through gettimex64()
and program EST with a base time that is already stale once TSINIT
lands.  Separately, a taprio offload installed before the clock_settime()
is never re-based and keeps running with its old base time until taprio
is reconfigured.

Take est_lock for the whole disable/step/reprogram sequence, as
stmmac_adjust_time() does: disable EST before initializing the clock and
call __stmmac_setup_est() afterwards so the base time is recomputed from
the reserved taprio base time and the new clock.

This keeps the established est_lock -> ptp_lock ordering:
stmmac_init_systime() only uses readl_poll_timeout_atomic() under
ptp_lock, and __stmmac_setup_est() takes ptp_lock through gettimex64().

Fixes: b60189e0392f ("net: stmmac: Integrate EST with TAPRIO scheduler API")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 31a66e855d6b..6370bdc6c58b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -129,10 +129,19 @@ static int stmmac_set_time(struct ptp_clock_info *ptp,
 	    container_of(ptp, struct stmmac_priv, ptp_clock_ops);
 	unsigned long flags;
 
+	mutex_lock(&priv->est_lock);
+	if (priv->est && priv->est->enable)
+		stmmac_est_configure(priv, priv, priv->est,
+				     priv->plat->clk_ptp_rate, false);
+
 	write_lock_irqsave(&priv->ptp_lock, flags);
 	stmmac_init_systime(priv, priv->ptpaddr, ts->tv_sec, ts->tv_nsec);
 	write_unlock_irqrestore(&priv->ptp_lock, flags);
 
+	if (priv->est && priv->est->enable)
+		__stmmac_setup_est(priv);
+	mutex_unlock(&priv->est_lock);
+
 	return 0;
 }
 

---
base-commit: 22b7cb932c6a0f7566d41072be6956cb6c8af4e1
change-id: 20261111-stmmac_set_time-est_lock-f74f4ce678b7

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>



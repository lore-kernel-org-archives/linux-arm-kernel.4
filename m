Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC183606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 06:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=21wD2LMq;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NtfSIil9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gPRnadH8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=n1R6G+j9Y5dC8NY0Dnd6V51TKEM7xLf0H5qeWnZ3dCE=; b=21wD2LMqlfT9fj+70bqu2MGCqf
	Q6d7W4v/V8NOTCam6OVBowwFWAQQnQfY9t9wXaz/cR2zJVBSDFVhWKiiavcFB9k53nvWsPTWpI1mG
	OyNM7hXWxahMyfRm0WDc+tap0BzJGbxmTcZHAyr15e6OeAVDQiTV2IWKsbIGcUZQxyZZTOCmxPS1f
	ZvoWtG7BpvSSFxTc0qoDDVZiSxJQEVUPK0e6xr1DjEZoZPf0wwYj3wlKF0b5Clo6oAfY9Ju68VpwV
	UClsCe4KK78Yr1BTYzyrHVdGam+4RAv4cH0BF/IiUE8tUOjHjJpUrFL+1NQiv5EHxyv0aolZHDIUb
	yRxh7Uow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpGr-0000000F1KM-0scD;
	Fri, 27 Nov 2026 06:17:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpGo-0000000F1Jk-3yiI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 06:17:20 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR5hFbF1012358
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 06:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=n1R6G+j9Y5dC8NY0Dnd6V51TKEM7xLf0H5q
	eWnZ3dCE=; b=NtfSIil9QhHdQAl4WCehJcVv9oRyaWe7i2Ns+NuZMskhfrrKqzF
	AeDvLzQ09Fd1PIdNMkoy2Ji+cN6lrewrsMDPMFTKX8PE/y4HSO2OZJh0gb0D+uUW
	sqbLHCQag8LxGVIddpcJvoE/OIePpLcI/MNs0SfHVJRhQdeYNLdAlZHZTh6m/F04
	MozanR5n400uT4kWdQZwB3FMMlYC8qP/dl3q6RpbroBCdBRj8tA+7g46HewWPERR
	4MJyWxqDZOtmWmY1oNRZAah/gVO1so8DnZQzzjV7ezrt77828nMA44w8soKJ5vph
	bbUHWA3EzeoE49OrW+hI/l+ikwVxiEBIVhg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf922g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 06:17:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b41333cb47so6521898a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 22:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795760237; x=1796365037; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n1R6G+j9Y5dC8NY0Dnd6V51TKEM7xLf0H5qeWnZ3dCE=;
        b=gPRnadH8Q4ToGlfVaMLgWxgdTPZmS4U00wberFZzdeplYSF5RM4U135VNSIBDVzh7s
         EmEzTO7gyS9q8vLNhxMSFQLOAshOkroCOSkgpFeqRGm26DYGKGWMszryLkxODsJivPMy
         g7ql7Y+us9XL5OCGYe+bmIBR6YLnEcLpq0/dXSt+ZyQgr9YM1fSXNAKBkJKmPomO4PQ6
         IM0tjoYUaCLIKGQLmDg6aJXsiuLjvk38k2/4Sm9Q3CVk0os8lWUtMYPIYSb97cHckpSs
         9oYDpyuvb8qw89jw6ArIfFU3j/VPkI20G8BKmxSOam9IkZY+W97FKLpvJujs0SI/6Xrt
         Fu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760237; x=1796365037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n1R6G+j9Y5dC8NY0Dnd6V51TKEM7xLf0H5qeWnZ3dCE=;
        b=mxPr+ZGaMItNeFhQu3brznrvSClSIIRyMUpdce/ItoyOydX+/xil7E/wXu8sfvvqmX
         OgYqFpcoTXjt01FEBJxK+GOsaxr8ekVcc6Xi+JVqYcb5KEuUNLCvf6uFadaFWvDrFJ2h
         oDlz5GESVFEGC6qmKtfgYqu1LWNgvb9vSSz3JAcxuDKymHdSGNLo3EzWO7jrqR7/J6X4
         moY053EgQR3BPUB6Mb+d/ogOaxnmVhQeXku8/jRBK8ZaKGR2IIJmIFlewJGopuLnesqq
         q6QAkiOa7KmPdfI2K86Gny1kpHfZ3Gx58UXZ0CxnjcKO2xutAJt09C7MxRWSN83EFxFR
         EENw==
X-Forwarded-Encrypted: i=1; AL+hErEQaOnSc3QYG2m3vTB1K+Jnyv6zTwz9PvBl3w7Q4Tka1D3g/o0npAR++mPzfRXOPNSfH/CJmr5IRatEqWo/+cDz@lists.infradead.org
X-Gm-Message-State: APuU4Z8Ywwp6e8PfoaH64gEP5Tp1cM9plgKr++NLkC0AfWuFPan8gBKe
	0NvRLBwciN9Ozg0pynYx+vCV7FYpF56jkIh5kahySK2bqXLZbaXD+0U+Sy+yiuvZtrzoD6xzWE+
	vLIpRqrVVCiNcDkVKqMH7i/AhGUG/QK88HvHXA9GWMYvgAJFV4HQQla6duvgmgIk4WsVdaNOObP
	6L3g==
X-Gm-Gg: AZFdTZdfNVqUsvtYpsqe8La4owdlSt+VxxxOt9GnW4SAP3C7E7eSthbMjyCdoxDd4AC
	hxRnbrRYsD61j3706bKkWVkzAas4CphveXvSK6mCN9s531QnF8XB/E1OGvmw0wz2muTeO+I1cJM
	lnjZ//JsdHTuAUiCZ1t6ziz9phl4AhZAgaGmKaalI4YzZqcyOifr6sNKCFCR9il/lYjNP7woesE
	ZEhY41Cb+QfH098RPKoNF6K/0gkgX/2WlEY1uONj59wMGHotaGEBgMlGyXQBNz3oySIaB/zHXRd
	vQt8CExClotQ+z5Ipmv6qyRKDE8LfjSYNXU1IRiIdeaZi6IN2quZXECAnYKqlK3aZyJw+Kr1czy
	SUz+36ir24GQ6qZ9Wyi5Z2p5PnITYv8vIhDZIVzNC7P3E5/5K5YE/A/oQpyUaiZLD0A==
X-Received: by 2002:a17:90b:3f0f:b0:3b3:ba43:54bf with SMTP id 98e67ed59e1d1-3b41c925a7amr28431838a91.27.1795760237605;
        Thu, 26 Nov 2026 22:17:17 -0800 (PST)
X-Received: by 2002:a17:90b:3f0f:b0:3b3:ba43:54bf with SMTP id 98e67ed59e1d1-3b41c925a7amr28431810a91.27.1795760237169;
        Thu, 26 Nov 2026 22:17:17 -0800 (PST)
Received: from hu-amrianan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm36174483a91.4.2026.11.26.22.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:17:16 -0800 (PST)
From: Amrit Anand <amrit.anand@oss.qualcomm.com>
To: maz@kernel.org, tglx@kernel.org
Cc: radu@rendec.net, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Amrit Anand <amrit.anand@oss.qualcomm.com>
Subject: [PATCH] irqchip/gic-v3-its: Export its_cpu_init for hibernation restore path
Date: Fri, 27 Nov 2026 11:47:11 +0530
Message-Id: <20261127061711.1837870-1-amrit.anand@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OdYaTHBxFmZa0B2L_awb9mY_J1E06-87
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyNCBTYWx0ZWRfXwatuzr4OwJMw
 cpAVARcKygIL4DtpJgu7tP0sEGVYtPgeM2zw4rAmAtK+PV/Yf+6GRG5bY/TzFG0sDrNQbrkdVFa
 Q6IUCnzUP+Vw4IepEYXiG8xwhnuVexGxbLl3aQ6cEzw7T91qq6rtD7f7EdrvXOjf4NgmQx825mP
 dmkXEUviNoFhyE4/PCarl4mWkrOoHcrMwXmjEFb0Rc8wT8rSUcmARlL9IDmUFYJZ+R2ZrRiKTkA
 unyQEsnDE1m5tKIYkoPN8BItwMnred/CUVDx6c9WZktqQLwduso4gmstv2th/0Yyf9jwJ7dQgsp
 dxVlqLUTfmSv5jDfNUA+Nk9z6+DNEOPy9y6dNXck6sXFaC8CAdCj6mxd1UwuaPjH1UTAP/0q0Zs
 jxJrtRipy2MSfKeqR61wFeLvXf9VMrgTvihPYkJ/QDXlKPoltrNtkQznqTdGDSIK12C3f+0upyt
 bryDmc5hlqi8DwaLZPQ==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b09206e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VdNlaMo01x4upjs-fioA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyNCBTYWx0ZWRfX2OMaQ3SsX+4R
 iXXt3PkcjEnowqSDes5O/RzHiJDlurCmJlQFjbZrOA1gotLeLO1/1c3g1FOFbluDcmro1fhBjrx
 B3+E5sNEM602dHOpo4AOjLCcVpr3QU4=
X-Proofpoint-GUID: OdYaTHBxFmZa0B2L_awb9mY_J1E06-87
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_221718_988874_6CFF7524 
X-CRM114-Status: GOOD (  10.94  )
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

After hibernation restore on affected systems, MSI users can observe
timeout/failure symptoms consistent with ITS LPIs not being fully
re-initialized for restored CPUs.

Export its_cpu_init() so restore code can invoke ITS per-CPU
re-initialization explicitly at the required point in resume flow.
This also avoids relying on fragile probe-based invocation.

Signed-off-by: Amrit Anand <amrit.anand@oss.qualcomm.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index c952c069f937..6cf156d1aee6 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5456,6 +5456,7 @@ int its_cpu_init(void)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(its_cpu_init);
 
 static void rdist_memreserve_cpuhp_cleanup_workfn(struct work_struct *work)
 {
-- 
2.34.1



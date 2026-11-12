Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B268F606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ACTI7X1B;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTDMxJkF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G5lCJNwg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sOHdKOtYrE6ti1WsC9g6oDfDHzcpc2yHQ0W/WOvdgbE=; b=ACTI7X1BOH8U07
	dnZ1wcN/A6o+fxiqstl5IuEc3CZGYGgj+eakB6CQyH2bwAdiC9boT/6MUNxTu5hy8L6PhQybZA6w6
	3KTmtDMaHL84QcCe0E2GluyUW58ggBcoC5zB50uRPMH+CHHMLkpwa2+QpwRWjTICjMau4FCvfyyRa
	G5FKggNr7WaQW1KaqqF8OI3f+9FMAFoEtKgeDtpM2gdxz2Y3lbb3BEm3VZ5MGYaLCsPZmNm69Dvfm
	BekftxvaS5ev4dGbxGx9KWwJTjO5i6l4GwfcCC0NIGDLguhFp3iuDsDkXltOcvsUlzHn7vpnu5cWh
	Egm2/M84sfxx9LK9aQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUj7-0000000A0AM-2JO7;
	Thu, 12 Nov 2026 13:20:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUj1-0000000A08Y-2WP4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:20:25 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACBHQej3893759
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 13:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sOHdKOtYrE6ti1WsC9g6oDfDHzcpc2yHQ0W/WOvdgbE=; b=RTDMxJkF508Dh42y
	BaoG1QT6krm5io92kTIWgovSydZvkRbbYWPAylkUMdx52dharX1koMAVwtZ8+VeZ
	tTRuOg2fyUhzQwuoHPinJzOnAjKIgfZQe0eqIYiwp2LgsDb29upW5LCIcEuQwhB4
	6O5XBOmxtOjBdzSJvmmbseT34r9CvVjI7luek1oKTBU7L26D68Li2d7kHtOhi7gn
	87EbdNi97UAlPilkGjWSj+bK/8BkXN1WA6E0qQg//+AIQaZ0TzmQcSeYcBEUEEt8
	fMl79a7n4O43kEZoHcECn50f0r2uCx2VhHXdtwBAb9xy4+DPDBtGjH7RFjyD01NN
	i+qfTA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re1quq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 13:20:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so895154685a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 05:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794489622; x=1795094422; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOHdKOtYrE6ti1WsC9g6oDfDHzcpc2yHQ0W/WOvdgbE=;
        b=G5lCJNwgX44ZqM8LUmWhJZC8AvXp+YSKqBbfdGmwR34ZI4XF34xq0U5zb+wNRojBnX
         yFBHYrNdKBkCfn6vvE4DAhyPe94inQpRXmkHFoMOVwZGDTn0L3HjD6jc5fwDXyGISPAG
         GtRaoLbt7L6HyGR80M/jrAexgCe+C5csBit+S50ElLY9ORFHTasV43LxZ1GNG/7m+QdO
         UYvtsiB9cKXobLM2jRWDk/KSkNts6qJMRHFoSvyOPGXJe2d34yAjnr+dG0O+b6w805us
         11l+eFNzEYnDpnpJTg4Ogcp8NAgfHI+rMNeVrh2OXk0Iskv6voQJprxDi7PrKjTiaQVM
         Majg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489622; x=1795094422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sOHdKOtYrE6ti1WsC9g6oDfDHzcpc2yHQ0W/WOvdgbE=;
        b=jwqfwQ9n8WAAHSSn8gPdtUW+7RdByvQfjsLh+tjvvYGtF/Wl/zHfED9ZXhnfpGreX8
         Foo1JouLDmJtQwwpHgFkLTcFuxSrR9utu3Krg+1e2cO3iGwSRuF/DxjxjVeF/ZLU34qV
         nYbKW7tCPdBNEQ3Uvw0DyQO8ew9OUVIpSqEQYJte9SbBZQbuDMFyRrUiUT8lkhqJ7BA9
         nt7Sn67t9CHYZW7UVegx/9GkaJudmlyLZAYyvnUNtnzW3XVhKrcXao+NYGE8q3qt4qOD
         69kUVl6tA++Q27OJRdQqNvZiIs6rVuZ0172ifDhPI1tHd4PK/x90TMd8BemLHrOCtagF
         gAhQ==
X-Forwarded-Encrypted: i=1; AL+hErEs+RY17OSYVHzZohVydrypv1JLXygerk7b1l9eNjN3KH4A8kk3qLSJH5NvQpxtZUBnNoNciXvOsL3ulG7dVola@lists.infradead.org
X-Gm-Message-State: APuU4Z8LMNbDkqDG2sBKFO1Et30or7iEjeSD4JLHNxL1Rw+U5KromyP1
	Fd7zWQUMAsLl+vYor58f1VoCZRruJnjpFVIEsJeNR6sY7IBJfvXv/YlPPL1BruQiUsq02PLLcH0
	7cPHuvTLr/yQnJLq4czjxvFzs21fMeWMnLd+TX6OQF3vwA1JIG2q/78COZO5LGhbqg4TadWwbrd
	5Pxg==
X-Gm-Gg: AYBFou1STLpT6bOJxFuD0HksvGCo4SHkYyu+zHi2B8vMvZf+vorQ8QfHOlAcwPFqdOL
	YLmkej4z9o3T1ntl58QIt/LcYSgpPzP+ExJOn9FnrLqFuIu8cFsKBvTW1gQk4BxoAw7sBs0dB3a
	xpCXSe1J3WCMLo8gL7a5KlBkyomwpmFQqEQ+djpqMM6szWHt+tVPVH1ynVGdQddJQ7djjShX3Mf
	kLy+r87Gx4bT+4JnyrnoQz49UIJNkQ9FZRW/oTOKFTFnECXVYp8urZne+wyLDcOSwvdvxzMfcI0
	mFLDWvGecilLY4IgHCTnMOqNEnvanajLxbm+SffZp5hRlRl91x50qOltRAHYt46cwNl8DjkCqjz
	gaixKhtGgHZMfJ+tSQ6qGOZZVtZR4aehTiI2mV4U8w2OCPB1GycwSWFvkjSA3z9yMrGJTH86A3N
	pDNxihONWUCeEUz60rkbyVwxC3pzsFxr9Cs0chrZhYLPxaKuHMbWhMEA7OMutZTlc=
X-Received: by 2002:a05:620a:8018:b0:93f:4921:6965 with SMTP id af79cd13be357-947b00b3c2amr815414185a.61.1794489621830;
        Thu, 12 Nov 2026 05:20:21 -0800 (PST)
X-Received: by 2002:a05:620a:8018:b0:93f:4921:6965 with SMTP id af79cd13be357-947b00b3c2amr815410785a.61.1794489621347;
        Thu, 12 Nov 2026 05:20:21 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a495csm16744366f8f.55.2026.11.12.05.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:20:17 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:20:08 +0100
Subject: [PATCH v12 1/2] crypto: qce - Only register algos if the user
 really wants it
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-qce-fixes-broken-label-v12-1-7b5b9c7083ed@oss.qualcomm.com>
References: <20261112-qce-fixes-broken-label-v12-0-7b5b9c7083ed@oss.qualcomm.com>
In-Reply-To: <20261112-qce-fixes-broken-label-v12-0-7b5b9c7083ed@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Russell King <linux@armlinux.org.uk>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Birk Skyum <birk.skyum@pm.me>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2262;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uNWdf7JMTPD50Oq4Q34RGGw6aCVGFgeAIRGofUpNzcU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9b0JlqMlRyBVpFc0kBTJiSqRQUy68ErqMNtxR
 wWCrVcf9EuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavW9CQAKCRAFnS7L/zaE
 w6arEACorZuR3+d3VjlfFgy8L0TymbxxLQjd/fjA019WVhb2ONi1ho9cV/b7XiBgidpiNufnH67
 bvQBcnu867YgJe1vsh4hc0DBLnCufY66fk5SePylcV6oAirKwoHY4/kG9KpnhDj1oTOwnA4IFhs
 K/fzmC9PoPAN51Xa7rg+oltR/p5rp5uqBBnOyZvd+ZsEVnFvfA/zIMcHzXs3wdgCsI/nTMWzGS9
 leSaSR5m6f89F/pUDDl0oO6jjKrFhTG1CbGwkgAmTRo7nfuG2cqMoh2i3iGY8iEL+EkmbH2WAG/
 /Dp9ffP3b07xP8jHS0FHDOqFLvsaVc6nGKWkhxhsVQU4lLzTwn1AT7sNUlgKROfI/tZ7iD+3VFD
 sSR8klidK+ywgzSP5dyUzOvkjMOmRirQbYT0rlaSCe8HhWDSRz9rt5eGEQIP+NbZCV8IjgMIm2q
 6vU5KKIpbQweuGP1PPQDMAjlFWLQpxwftmSUB+Q65KwaUjX7lov0hO04rtNkrq0Krwvch2sUVXN
 9Kshp07fgmVrz/O6dujFwyfGJPie48+kMzD6rzGOIRGaqZ10xc7YW12IUooa6SZScHdaIOtAM01
 YBUOiwoWw4Va1FwqOYSVkGCHvLGUfLs291wqvCDlt05OFwrWugQfTiflKAHs4wEDFDTv/ZmgDFU
 0ThVkge3KjgRyYQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: jAD5TlYoAbCdWfAg7QYN_kjB0zoqj9u6
X-Proofpoint-GUID: jAD5TlYoAbCdWfAg7QYN_kjB0zoqj9u6
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af5bd16 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XywcRVADl8Xu_msC9vwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfX+TspgvTAosLJ
 dhT1TsO08bbbmPijXhms5pqkPU+COwymxiXZYG/Ncb4vRrAzIcad693xj7FdE/nbltNLTRwqpEw
 MgpvfBC1aDLSu6T/Ei272thCnc5zb18=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfX09zcWHMWf04h
 w6O6zv2k69sKyDWdtwQkENgIU12+KxYVLR4x0WVLtOcdf/ZQG8YrxtJJPC7A/F9cSLoTV63YrIV
 TL4MjMTcWUylgu4V8s62CxRghTu/l8i0mdek9AR8/Ri70+dv4ZCBc4hYmn0ZqHsN4oVjwfaYEWi
 OBCGiXHwEl3RI0B4+SNSqcredekO29XqyOOj/8FmZ5PaRddmKSXpiY4EWpIA8UqWHwIMFLhHGLn
 uQoGSNDcvCtNXhy1NBsPVw9M5EAcN7u0M+3d6mIcObnpjXsgDdcZ34Dosq40BhwesSnBkjxXkfx
 Fa10/qPTKeGPjRfo7u10XxShUVc2AggBIfM5/OV5w4/G2fQQx+BE8h3dnl7KPr9t/oQm985Z6xz
 +lyOY8WMGSUqKt0MPHSmbtiOaktpl6PHueY4ZdaPsQ4UFfhZbKBp01+cCnRT1g9rkZyhioflFi7
 /WeEuPCoqlYzBorcjXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052023_679792_8B8CFAAB 
X-CRM114-Status: GOOD (  19.21  )
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

This driver's crypto algorithms still have a few issues that need
addressing which don't currently trigger any self-test failures. For
that reason: don't register the algorithms unless the user really wants
it.

Add a module parameter to the QCE driver that by default causes the
driver to *not* register the crypto algorithms. It will only be one if
the user explicitly passes the do_register_algos argument as true.

The power-management part of the driver is kept as is to allow scaling
down of interconnects gating of clocks by runtime PM.

Cc: stable@vger.kernel.org
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Tested-by: Birk Skyum <birk.skyum@pm.me> # X1E80100, Lenovo Yoga Slim 7x
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index a009c791417b707c5d4e98fc30111863dd8809fa..ddb4df3d227f801e566422491b488c5fcb777717 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -10,6 +10,7 @@
 #include <linux/interconnect.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
@@ -22,6 +23,10 @@
 #include "sha.h"
 #include "aead.h"
 
+static bool do_register_algos;
+module_param(do_register_algos, bool, 0444);
+MODULE_PARM_DESC(do_register_algos, "Enable registering the crypto algorithms.");
+
 #define QCE_QUEUE_LENGTH	1
 
 #define QCE_DEFAULT_MEM_BANDWIDTH	393600
@@ -259,9 +264,11 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	ret = devm_qce_register_algs(qce);
-	if (ret)
-		return ret;
+	if (do_register_algos) {
+		ret = devm_qce_register_algs(qce);
+		if (ret)
+			return ret;
+	}
 
 	/* Configure autosuspend after successful init */
 	pm_runtime_set_autosuspend_delay(dev, 100);

-- 
2.47.3



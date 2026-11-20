Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B89B606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 08:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zKOKhZTL;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGNIqfNo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F3t1V3i1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r+JhNs/hZmUB32T/4fK4AcrAesi5EoNhHXMKe2hgKWM=; b=zKOKhZTLm28/zX6bakxFoT1Bhs
	j0wI+WqnkotqdbzyjRFCjHoqmcnwoUMLPbekOVYBD8Qj8hPI9FgXorcsKJ5RQpD5sAwMsRWKmKFG1
	BkQi3OGno6a4MY0+6HoPfUxdgg+kDAPxkVvZTss10j2e8wuaQPi/ab2Y7V1R/gf25tLrfGPNZsXzd
	/S3bnrb1UZSP6vRmgsQktZNOEqwfUa2eYF8dPC9aMPTO/QHLE6PCy638D7KaH2EWNFtKox3pfwCGw
	ikaG0nE6oiCU/fVkrWnzdFnUWxTz5YTekFs+s2baqf1dt2JKVIweHMg97lqjYgZDkEoZSUI59Un3/
	vPbHB66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUK9p-0000000EM46-0aF2;
	Fri, 20 Nov 2026 08:39:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUK9j-0000000EM2g-2iA6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 08:39:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fUhR3321313
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 08:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r+JhNs/hZmUB32T/4fK4AcrA
	esi5EoNhHXMKe2hgKWM=; b=iGNIqfNoVZ2GCLVc/iSdDQdEWKccbAIVyLPosy9a
	EcI2rFgZGwOKDn6Kbyqhh2ZdpxCBnAHiOtoQEtPnwZeCJmlwKl6JifwsUVD1zckn
	S1YTiIYhOVDgMasD4u6lURu9PmmbB0QhrhaUj9N6Xhl9Jg8RkDx1bnfbcMwuPzhl
	2Ke9MC5DxtnaBp8d1l1jgQI9Pv6a2E9CuibDfZcxw3Iq+k29HZMAYy6dI8jY8jP3
	0scZD3qqzbc9DnOSF5QuXlVfoBiuCNfkxzZx2JU9tba2nLskjYKNAl9usR1EhbAz
	lMGWqUJQ6c6sEhIuLIjp+/Om+o/fSEVfLS/b6TSGOkZ+rQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2frhru64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 08:39:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5363fa3d3e4so13068631cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 00:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163978; x=1795768778; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r+JhNs/hZmUB32T/4fK4AcrAesi5EoNhHXMKe2hgKWM=;
        b=F3t1V3i1BLQbtRw4GAx8lE++ROEDpUWG0VUKDEE5CwCqhc8PFyLgLoZNBJmcaEGTpz
         xYcepWdFeJUAm35653fdWvqQXuV9eDBXQnE8Y913xZbqOAyg5mfxjsq5qZNvjkOEXwYU
         F01EwJx2nczTWUvDRnS8aPhKvZ+l+yDpLbLp0GpQEzUP/Fy7BrUmxltvVC+25IZETlPI
         6sDKFMC7WqOTOzySXeAMnaqKFsG7C6q1vHJp8QnLyEBwLTiU/ikY60oaqVLrB0CgN4eS
         xFeO4kt6eD1diejj9cU+yoTFLibTlY6vBv3Dif0pDqeLrLrDwp5GZhrhE3GbeMY3m5EP
         9HHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163978; x=1795768778;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+JhNs/hZmUB32T/4fK4AcrAesi5EoNhHXMKe2hgKWM=;
        b=aqLPgOqisU7YscrGUdmHUwCkS0hCcurR/knYg3n7ebmmOovtO/oI4iQCs5+0OdgPjP
         83OVP7atP9tDM2Wc+VN1ROBMaO87+fPq/lLmiTXubNwRjk3RfBymxhdBliecMHJS+qYu
         g0yDETFRIdRLK7U3WKjzRXZ94ijGZ7Fx/Vc03YzTK+grvt2a+PheRYQa5cZ0mUpsnyNh
         1UiyqAsLMyB+syRGDJOI4YrZFphMyLb33+syfi1RPYNY7c4Cwd3trzCMLxnHVVxhVQVW
         HY7V53J1i7Gv0DEPbLqpKqIGiII8FKtq3BsGCJnbnu+3+0sI1AUeVXXofB/Cg5nez2P2
         sIqQ==
X-Forwarded-Encrypted: i=1; AL+hErEvnxMTRRpqgIHT/8jlOEwEu+zyoAOSKzygyu7pu7L81s6IuaRDkBvr+FcWembC0XoL3dRSP9uCoR5sCxWJ9RFW@lists.infradead.org
X-Gm-Message-State: APuU4Z90KAxK03zOzSjaOW2qOGV9/e4tksiv/0C81Zv7tQmQhgvoeWHA
	42hn4zi/YDPaOuBSoJs06xWXyIOqyU8ZuKkt/GOLhMOKzEuEXNRCsb3ZC+z0TwcxBJDG4MPKHMB
	YjeBxSIo+t7LF/uykxPWlXMi7g8QMY6WULvCG16Z1tAGQwqf7K2vyP0PBoGD96MgDXZTS9A3m6P
	mdoQ==
X-Gm-Gg: AYBFou1Uq3daZ0HmUZ0rrd4DDGpKmR65xG2lViWOGg5odUMCdcxSDU8vJXbFFhutwAA
	r5iMpt2rIHxQVzz4M4KUqkedOn64/nJObkjf7XdvWA1BXmC6Yiahb/gsL5xmCuCipUZwQK4LBMf
	/YmkPDx7aWT+OLKNvTlz/l9JoP03pkufJPmz2f/mxAdLzSSp2/hE3RuhJ4QGXqjbg8c9NGZVLDH
	kkAknmgLGSWNcoWpiDBt6vwtgpmn8vi6y5I/At6daa4b/UQ3L78kh1wETt6auy042PyCzkmEE21
	e6JkuI/EGKrBDxBuuYn6WUVc9DmkbaN9YylNVc62mz2e6QncVM8BIkRujKuGUWXt90G0BVtxnyr
	X0oLAo2ZERgpzwgssmL2kb0uxmRpSWUJTXXEe4O1K5Mg0WP+u0x7/Jcf/JdLybM4Q
X-Received: by 2002:a05:620a:6481:b0:949:90a3:3ccb with SMTP id af79cd13be357-949ba9fe6e3mr362654285a.61.1795163977924;
        Fri, 20 Nov 2026 00:39:37 -0800 (PST)
X-Received: by 2002:a05:620a:6481:b0:949:90a3:3ccb with SMTP id af79cd13be357-949ba9fe6e3mr362650785a.61.1795163977329;
        Fri, 20 Nov 2026 00:39:37 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm111790855e9.11.2026.11.20.00.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:39:36 -0800 (PST)
Date: Fri, 20 Nov 2026 10:39:35 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8750: add periphid for traceNoC
Message-ID: <f3gazpnmbfqjukqi5wetqokl6l5cy2xtuzvdtayft32qadbg6p@kgyw2kcgvk6p>
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
 <20261118-fix-tracenoc-probe-v1-3-0298dc5f05ac@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-fix-tracenoc-probe-v1-3-0298dc5f05ac@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfXxXX2u41yCAfa
 kDY4iyhQ0QI1exZN35jUn3W5lrlgGxvLT/r819f+flHkU4b1XuoTOcvjBO7Tcy5HwGh6P+S/jN/
 reVnIF9vDxC3IPfiMPOmWOqFrR7yc0o=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6b00074a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kDRJwTVxGBJz2jiGre8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: BVrJyVd14fLYJ4FbfZIDHWotqom4rG9y
X-Proofpoint-ORIG-GUID: BVrJyVd14fLYJ4FbfZIDHWotqom4rG9y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfXzR1FFOfYS9oD
 1Lq1UbW++XOApFqZS2iwBVxSN78ey/022B2/ihxzTGpK8wf8mScMramWJ/L54mfyfwN7mhgHoi0
 T1c3brcGZAUAvTDrklZsODQZ1Pl2l2Hata/C6jZjgUmhQrKNHwzxrRnZKNdhPA+fIwDvJCh1FWZ
 bnGesih/FOedKmZUQjkr16czyy3iPlmDN6Avx6nSKzTvxCXYC00UrQ/BG1T5UJBSgj4tx/pqbVF
 +MY6UL9THeF+j/kSb8Tf9ECIXn8eEOPAq53KbCJO1H+SOf25sqAzw7GFE6Ep8uQuxuOego4doE4
 qiXLVMNV/4c8N2lSuzm4NuUaIGRsXuBTfkUN4SqX8tugW/8o2V3bmiorsy5mvmJenEKO/yw5+hT
 eKaq3kIjhAc4EQUWJaJA3PRMhd2XKR8NeoTRfiVNHjBwIo8U1ntiQi9oX/fpuethQF1GNgirVWY
 cETxmS8zcbWJghAKGYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_003940_907993_A32B28B8 
X-CRM114-Status: GOOD (  16.76  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-11-18 15:01:45, Jie Gan wrote:
> The traceNoC node uses the "qcom,coresight-tnoc", "arm,primecell"
> compatible, which places the device on the AMBA bus. To bind an AMBA
> device, the bus reads the peripheral and component ID registers (PID/CID)
> at the top of the device's register block and matches them against the
> primecell ID. The Component ID returned by the hardware is 0x00000000
> instead of a valid AMBA Component ID, so the AMBA probe fails and the
> device is left stuck in deferred probe indefinitely.
> 
> Add the "arm,primecell-periphid" property so the AMBA bus uses the
> specified peripheral ID instead of reading it from the device, which
> allows the traceNoC to probe on this hardware.
> 
> Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF3E606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IekNuKe8;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bn/+2yNK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VJrFPzB/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=shYVcCkI7WsAel14qoPcI2k2hO7EaXLkaVqcGNDiH2M=; b=IekNuKe8v1HrZQDe36nM0MyIiX
	xKW4XBfdYuMQgS6xzW61+5YlXyVRT9a8LEqJhVIVXEz+L3qrP9fyXvWB7J0+LXaHwGFUSUJSU5IZr
	xuHb0mpgxoaPHpQJabRFa5GsxN0sYzghzNcRo6PUbIM59SB7nMMPNDqyd1Qco+/AxYMs0M2G81z48
	54SGll5ITTqBqpnZFAUy2CV3rLtCA04SNVhAqyPkM8ayZVROM1X8GUF6C8KhY/gC+N3rskZoMF0Zr
	n3jlhFwxs0r/5k+kzf24Hs09cQAn4mMkCASwksUwfIqp5tOQLtGkPKMsc0PUINcIuVVBTzJgTTlm1
	m5wpsSKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZuz-00000004irj-3cu4;
	Mon, 23 Nov 2026 19:41:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZuL-00000004iYW-3wV4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:41:18 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGuaH2340286
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=shYVcCkI7WsAel14qoPcI2k2
	hO7EaXLkaVqcGNDiH2M=; b=Bn/+2yNKAWCbEFLfimFQervj6gTXuixll8020nAT
	iotFPwlivvF47lcIPwxH/WlQ+Z08mMI/Z6+PoUKgv/dh6U+T/Ee+dd9bYCPmCfR7
	kKfncRVAAaMkzYYe5xUW5UkbJ3fyuvZj8QsyEzZPW9lG7yOvhFq5tP69wgj5UvYw
	wpMhAiscc2j8PSZXoIVLpjE402kbi2lpAjYUHHvRaeO0bMWGH6bfCD1/X3G/dD9R
	r5NuxTqh+KH2xuY9jyWJvh1Clh9FQGtf4OEKaSLi6v4JEQ04uxTPX8h0YxxlVe+V
	oPCtpFZHnBp0AR69T1p7QzlVSavOI1V39/uqhLuWxHUQrQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3bbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:40:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-920f97bcad4so68868476d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462856; x=1796067656; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=shYVcCkI7WsAel14qoPcI2k2hO7EaXLkaVqcGNDiH2M=;
        b=VJrFPzB/yqh/aYgHXEE5ddnQhDUZTa75VQbVoMYgJzqn0EoHVjT0RCCmYLzgkbNz4U
         sQzuSZri9f2or+fGQYeIN5zsoGHbi/B/uRfPlLvBbe44yn8WlpKUvABqunmMKQ+q/0XZ
         OKIet8l9PoUtUOnQmhBc/wigKI2Oqmzar56J3WGhBzND2oqmNuc7SnFVIg3/gx0laiqP
         R3pmIS1YKodrq5Mezxsy9wJ7teuy/koikSlFlr9nuU8zaIXKz9GuCqY9Tpenv2QI7pGI
         TavexuK8TPFR8iCAi50PkpKoxdL59RjZ/L3GwrP8UmKDVzRepIXTkZjxmZm74lY4El+Y
         QEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462856; x=1796067656;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=shYVcCkI7WsAel14qoPcI2k2hO7EaXLkaVqcGNDiH2M=;
        b=tBNfhYXBY3OsXlY/KMd9Ru8kztlvYlGLOdsV0Od2pOsAztGkNCWApuMuHDIxcEF986
         CZFVXXUcfzoTjTmi913Qe3+v09d28Fq/ZKVe1AniyGvAFFmnmkoNh/j7PtDBZWnFSja9
         vwFSD6LwMcco+3pCcVWZ9BD3IcVSkbu/iO4BtIRBY5wvnNGY7nJSdlo4dhiQqCZhRP0T
         ZxGVUv+BUYPPGqs+jftMkb+x717OwLeBp+NNN0GxOtxqSRKEiURmmvJOBhPx8sx4mmwm
         leI/bRp20v9lQMX/FGhgoUA4A7KFnSvlDoUU3wPMZ/g9k1ZNGflakqCvMU/zHMsIgNI3
         wzJQ==
X-Forwarded-Encrypted: i=1; AL+hErFX7ZINIii+dwfv4TR3W7uZtkHo9U/BLhHi9PcWxHd7eTcD6YECuwH60gJC4KQdQnSl/mxMC03PNBinGFDcEjyE@lists.infradead.org
X-Gm-Message-State: APuU4Z/GXQgTBAk/9GIDnHnIJfciq2fprLfl+tvxJ1XKNKwLqGL3pFlj
	VwCwua8eNg7m/bKIVjo4K6VKvlcnsqswP/OldpcwZ6teto/REEYt5eo5JI2IPQatS8qnUft6/63
	rW8yyj2qFsgJpthP73MRbXi+49eB513JQSAjfxQTWtoNscVDhtZ7orKLw06SiGMsmF6uPv46Unq
	1psQ==
X-Gm-Gg: AZFdTZcew7Psef6t6gZbL2f13DIG4mFaPAVeqcNY4BFoeksv5yUGrioyXt2wh/LuA8Z
	yRKn8e/97oC5ue1Y34Ld9XV4SntgdS2DC9O25g9ocOgboh20abodS9qJcrrmMbhBo6jheI9tT/Q
	pUxph74CMmagx1byjqiZSIiF4F+7qYQ0TLG9756xi+hGGgYqh5FvYpXdKqUt/FqQgRMYjDst1Qi
	yMPTWh4APX3SrXH/ZLwNBTx93CENLgNf9i9gK5wHCciilCcPvKNRsasqqGrpH0Vr21RTXezGr5i
	OOhu7MTB6Ynjkn1HZXT2wVcssgPX5kjklCYKOM4poMkVwQ80aK6jLO6AJa0SoEY2pWUFD+wz2qe
	ErnJqyWZGjqTtwYho0pkVNe1yPVnLQEqEtFioVKIrtIDRJPbtZ05NI/cv6FbquOYk
X-Received: by 2002:a05:620a:4388:b0:946:6:129d with SMTP id af79cd13be357-949ba9e8dfbmr2179923285a.54.1795462856133;
        Mon, 23 Nov 2026 11:40:56 -0800 (PST)
X-Received: by 2002:a05:620a:4388:b0:946:6:129d with SMTP id af79cd13be357-949ba9e8dfbmr2179917785a.54.1795462855516;
        Mon, 23 Nov 2026 11:40:55 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm511746015e9.13.2026.11.23.11.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:40:54 -0800 (PST)
Date: Mon, 23 Nov 2026 21:40:53 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 11/20] arm64: dts: qcom: sc8280xp: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <cdf3mpbifvj56nbr54w3yc4ddshsgbbecfox2vp7vsp3bv2v6v@kjedaxblfiou>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-11-be30526391d9@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-11-be30526391d9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b0496c9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 3EX97u_y3ambtrjwdVlKSdiZHEmuX8QX
X-Proofpoint-GUID: 3EX97u_y3ambtrjwdVlKSdiZHEmuX8QX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX8QFGGYUH56x+
 g4SUGEdTNWzTdVng50kafDS0uIEiC/DneVVr/gOVkJ3mgfT0Vx+/ilviVRtM68pYd6EnE7+RU3T
 ZDdKBZe6JP+G0KbZTDGwikBYPTwU40c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX7JMnyvdcR/+r
 Qegx8yFloETVwDSqBjalNeL8YaGUXKpnYOgPW+hJlOFlUQornDiTblHl75HLTm2i0tNt5l0J9Zp
 pKHss7mqYpuDJ2T3xGqXEMHkRFBJxBQQsGFkzo+WR9upb00Uc+yseu3OoZxDTUwWO/cNgmu0ywI
 mbfxBnOhmYov4hHAsIrrVEE/vyoMD2r9r3moJoBgvdIuDB0e439id3bypS104C8yg3XIynQUjve
 OTURdJDJMN994ATBP161Cj18QTxheEaihxpsjmOr92v+ryFjfqvEZdSRP7ke2e+B63IdTleFCmN
 p1mxYUtXtLmUV9j0h4wLFuu7gNXnb3WZX395M8pIMbS8g6VsFvQz5kcsuQ4o9AF0H1KxBXOBD8z
 UI0Pehwk3YDraXsGc8i4aaEWtd6RxQ4HwGdSDk7HHnDhSgFWcEwv7FijyUrdEJYYTRNgcL4oHVi
 msbKULRdKbQ8Zrkfrvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_114057_982433_46C79550 
X-CRM114-Status: GOOD (  12.09  )
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

On 26-11-20 19:11:42, Bibek Kumar Patro wrote:
> On SC8280xp the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>


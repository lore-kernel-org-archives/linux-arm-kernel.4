Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDAE606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rXsG3Zlu;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PD6hAaI0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ROwGUDtg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f9Ly0H2eD+VpB4ntoQnCNH5IaZ4AVMAVdM1dy+tGVBg=; b=rXsG3ZluHSLtat
	7ki5prEP6CLdSB/z8+UjQHgwLhuZaBXGZKR2PCO1BO8Ypkoys5paGOBuNEwaJ4m/rQadyTSzO0yft
	i0ivDtz5HVExE4Oh0ziHmm4gJqB7JQqPbwrX5Mykpgx0m4muKysNVVY8QafwWVPcBLwqbfgH+JqO+
	PAqiQfFUByaBsyYX72UB/cZj3uVnN/HE5WgAeYYF5E0/1L7Zxx54OuJ/A+Pelfry22O8FNAPr4gQo
	uWKzz+0Lshp7j7iyHhAI7ZyP1ItAmvwHssUEi6A0LU9wuRLF8ITiY0kFyBfdpzaoqCivSkKnVaLWf
	ULIsgQojOrnWeu1YMFoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPGg-00000000mft-3i0g;
	Mon, 09 Nov 2026 13:18:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPGe-00000000mf1-1mT2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:18:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEodv1322908
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 13:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9Ly0H2eD+VpB4ntoQnCNH5IaZ4AVMAVdM1dy+tGVBg=; b=PD6hAaI0nLrQm9uz
	XCzX7+Col9KxUfgrilTFUnFUvNpqmRvwYtuGFnEZiIuepCYs4LKA+ae1LDXy/3je
	OcN8+Gf44pc3um2q6ZOC8id8nsSyzQIouuJ5iIcVRvMZ/vbHRr3Fcycfcbon7yJ7
	jsHHjSh/gU/yRGykgvmJgCvMLCelJjghkpXI5rN6/DINd3q60Ov5SmYhxCwUeADb
	XBTD7zsQmIfmFMiFOU2nudE0Vg1mAoNrDeE+FcRM3/hfBW6qdVJQTzapG4g1lQ5l
	SQp/LKfJSGFaV2ucmVL87hPeYJIutMXOwHole6MZ3SIUd8vYXbv4oBas7W6UxLel
	vZ1E2g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qr6qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 13:18:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac5877bso9073785a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 05:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794230315; x=1794835115; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9Ly0H2eD+VpB4ntoQnCNH5IaZ4AVMAVdM1dy+tGVBg=;
        b=ROwGUDtgf/TXZsUaoCu8P5c6HthazOXM4LOFiirRfuvQ3fXkdst0JF7VwGk23llDJU
         H1KlDd7ESrucV1E9kBUDNFB+cMinx2qrbVVIUXpjuULIkeEFFIS+mKMh8QidPDJn+L2q
         NmWZZcyi9wibaRdzjBmJxj911DAbPaI0ZU09GB/XeNNvCZhPck4tDxF55D84CowJA7Ie
         rBdA95cKIYb2PzaJgbtmgOWTtSSmY1vvqVgRZMMIWkvZC41WUju/z9C2Ju3gkU14wUez
         moSHreWCxBwW/xJfy4XeyTDyoRqUYIBm4MQ3nQ9icfOxo4zXigWDMl24guC35cgakq+k
         zZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230315; x=1794835115;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9Ly0H2eD+VpB4ntoQnCNH5IaZ4AVMAVdM1dy+tGVBg=;
        b=tBCPV24rB9ZrjbWMykreUhs/uEx3HXrLwwItQCb9eKrNi9IQGoDTEJAwTNkovRGHQs
         Fc3DLmHs0muaY4/TmnwP9/E9c4fFS5qMUOSLyFudiCLksjWRxzNx3PUhx97yAgIj3Jl9
         SWukDZ8B8co29QNaTOSGciHECwlt8cLpbLAijKdj0qTovdOPSxrVZVUMojuWnce7J5Km
         5G1JJx43mF7x6Z8vtpFmNWt2yGcWf8ZcIwA8+rOclSC8ZWRn/bEcwJorHIZ/oYeNAiA2
         Wm9y0/TbMYGlZGskVUUtIaCqcfYXxJ27rs+CLj6BFM2l4EKcEx+qKle+7UKZ7c+VRPNl
         yNeA==
X-Forwarded-Encrypted: i=1; AL+hErEIV9vhkeW8iD+Jgtn+FGbNSVqkf5SI0/yVtLCSGctztBQ/kEpR27rpUJjBhLKqh7NhAcR0AhgSOHYJkFeHP9ZZ@lists.infradead.org
X-Gm-Message-State: APuU4Z8kgNM3UmmIxyWd5t8/Gvo7ddwxWrlv0c2YGv/NBIYa1Uoi9gfi
	i839LzWOUj17sMYnwKiTZOiWyWMjwcDQDVdMlVT3uqm5gRRhkatV0/jK8p8YTmmkvoCG0fLISBq
	BbIrh7xuTBZZFkrVN3ONmspRsCdLOmer5B1T0N+TckuPZxVnpaXoFhCNHv4XMqfLrNk+pjqyWbF
	6ZVg==
X-Gm-Gg: AYBFou2gBRjS4g5Zmbst9XQ8GYpw4WyyinVQtM7bQ5YdHfGSd4mYBPUEJ54y5Rl7LcW
	2sWQdoEGEaIk2vQRd5dEOpWkoTPMYYqkchD/OLPGdvofoPErmqr4IOpl8XMq/nHhBgroYYn0Pfv
	gRcoWmeYOQhWwaI+1QC60FKsmpbX2zAvrzsZVLvHdR7KPmnZopYDOqrI+E2n0Bv9vR3QeAcNwIA
	QVb9OwJt5J9bSfMo1znAj/ze+h3DBkkJdx5eX/5Vn5BJ7AotHBTPH4p/nAvl5oAn4qt+/HucS52
	s3oixZjs2re9rZFQvqJhK50zMSXva2xMTJOwkMqeclcUmP298nNq3lN5XTm3d9wd8NHVrnoGfc6
	pZPP7NeKePMeO/AD80A23sQVDu3nKA0z+dp5ifUNm7gHr0zfdN0r5vuB7+DaOCN8O1pDf9A==
X-Received: by 2002:a05:620a:a90d:b0:945:c5b3:6356 with SMTP id af79cd13be357-94784143254mr685964985a.2.1794230314760;
        Mon, 09 Nov 2026 05:18:34 -0800 (PST)
X-Received: by 2002:a05:620a:a90d:b0:945:c5b3:6356 with SMTP id af79cd13be357-94784143254mr685958685a.2.1794230314176;
        Mon, 09 Nov 2026 05:18:34 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f93858sm167363866b.24.2026.11.09.05.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:18:33 -0800 (PST)
Message-ID: <1704850e-c461-4ba1-9a01-7fae3167bf5d@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:18:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add SM8550 MDSS compatible
To: nacht@dxdmail.cc, Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261107-b4-smmu-sm8550-v1-1-777d0a41170b@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261107-b4-smmu-sm8550-v1-1-777d0a41170b@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MiBTYWx0ZWRfX6IFYh0rNjBxO
 qnmoaZNjGlL/ddJemsITNiNdWTi5EEqYMTpIHr2EHrLrii9tTxXm2PqdvgwhgbJ74HUlrFx7S7Y
 tP9zD4J0LB5cQAeskQPmBr3XIasRS2xFLgFc/tOHPT6p/DpmBZoc3laIzLAQOP0UOfNs12D4lXs
 AGigZP6Dle/gCqTDy/uXpxHz6aTrcTbwxA5oDQDaBpmUT5cMTDSkUxwenMC9ftPllgjuMnoOfET
 Dbt4WCe0HT0ljD3Sp4PwJVDnybtVpxci2DQCXmfEAeyLlWCX/1qglcGWqNBJX7W8NgrIe8l+R2B
 MpAN0sppw5whENgnQySh6sSfZ5ixtiG0PPTAy6t39QbarxcIfmMIS1S65oI8YQDG9qlDbAvhx2s
 WpZz0hEqjkE7y0cFNbmyhO/q6UKYZt8tISVlhH777+Iy7k71XDPZdhHzV0mioxVX0bfu2nbv4dV
 eDr94hUmsFMU/AeMPtQ==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af1c82b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=UwK4q1c8QMLSmQHnhC8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: qLgxjTrfGb36q82Vb3aVyQnfOwvUFcpF
X-Proofpoint-ORIG-GUID: qLgxjTrfGb36q82Vb3aVyQnfOwvUFcpF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MiBTYWx0ZWRfX+pbW66cAGVim
 7cC401jmO7dPe3beX+TPkS4HevUK9tpJA2dUHGz3fZzM+FmXp6zj/ub8QRXGfgPKff4B+Uc9CzQ
 qzDDN/0zbap669vs50ydCft6v7rPN/M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_051836_471301_CF8B5694 
X-CRM114-Status: GOOD (  11.98  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/7/26 9:00 PM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> Add the SM8550 MDSS compatible to the clients list, as it also needs an
> identity domain at boot. Otherwise the scanout of the bootloader's
> splash screen causes unhandled context faults and the screen goes
> black.
> 
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


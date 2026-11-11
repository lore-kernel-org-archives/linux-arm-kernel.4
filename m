Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F00606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3R2V8o8k;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c/6tWjai;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=khQs+5er
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SaJOe5uCKAdqnsdm3vtUW0/3A+mfnzMOG+BVnbri9gQ=; b=3R2V8o8kCLz9vjgqQejImrQMcy
	LfMqv92bOl0Y51NF+Cvk57df4yXepMSElEO8yK4/VFIDm/tU3sF0gHvOM3kLDXy9zmaLCgSpekFy5
	ufX3QKlvDxEtW35rgIojot4H8WrTcUZ5iXJv40zBdVnST44cLPeYCw9rQIQbZA3ZH4AwO8OFlVmL1
	YW/fac3SG29icCGTIF++ZpesIrdsHlt6h8lubAFFOf9fqagV1guIQaMPa6k06TKN7SOn1YAgBs0bj
	EcUFNfaZWaJjWEn+wkKbwHa6Qr8hz51s7nXhNRBco+K5lihXhQwjrWWIQJlH2/jO9JL4HPWpaF9ki
	D5B8uWjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7tg-00000006jz9-28MI;
	Wed, 11 Nov 2026 12:57:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7te-00000006jya-2bCm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:57:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYwpf3291908
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 12:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SaJOe5uCKAdqnsdm3vtUW0/3
	A+mfnzMOG+BVnbri9gQ=; b=c/6tWjaijLwPvNFT0xJmmj6tJxhUS81CmnInYpyw
	9KcgPWfy3UKlK1Og6OeCX9CvaJeBGUIgc6D2USYRLDUNnc7cWg9Fb2ET4iK9sfWu
	UK5PnsfT+Lf59S/X7qftJMfosiP/oAQjRFuA5bBGrnGEE4fJrP0l/Mkn2mofcoSC
	+W+8QtkMASLMFsCLQn1eUWAjOVzZVOWFbHOAj5ci6tcx05umF7SetWwl4/+nBoWK
	uA5MkENhnAB4Bkd1wAXZfrzKUZSLKvSD8ulxfMn56Y9RpW1G2MQEMaNvVwpOO4yS
	d3Lxu9KMW4XOXF0DLpD2dZqiruX8PZ9NzDAU3vg6aPLlww==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp2jg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 12:57:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f33438950so650985385a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 04:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794401869; x=1795006669; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SaJOe5uCKAdqnsdm3vtUW0/3A+mfnzMOG+BVnbri9gQ=;
        b=khQs+5er84OiQ9Ji7vgRzTTZJ2N3iVN7bfkyIWjXBGAXvQWmFVEXVFVRx9IoLcq+L8
         x2aoUds8gteOwWQho5z9lhHRfO1dMUe/kU60ZidJwoL2AvhHFn/lL4pl74qcMQZck+Yf
         2hckxT9tIorUFM36KuNlF24h3R+wMCZCHEIKIjECXXO7xhdeZN1wV3fZ3V6iI+Pxp/vR
         ZdzqSFyTBG/dfGFVDoOv/8ZzNeFkCX60js+K8ng9E4fRVdLT6ZofvuDzIj5vXJ9azLRG
         7dkvuP/DALYxvPy/Qie48b/a22KBz2QVykm5HzqvNLGmN8pIRLuwK5DyTNHCzH6+zYWa
         9arA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401869; x=1795006669;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SaJOe5uCKAdqnsdm3vtUW0/3A+mfnzMOG+BVnbri9gQ=;
        b=LCQIFSmVWnaHg3U8jUVIu382R0qiWa+VUDJy0SXJDRpwSpKFq8ykYG6njyamCBohvf
         +SGlu3zeOe+ChfRnmOHjK4S5cvkxt9ZoBYrbuT6NvBkeMqBjrSyePYeAoKC9iqW9j93N
         6e/ZSq50Dty6UND72w9zLEgGRakrhtQGkRm2I24CZptLEKxM79JkyhB75LfLigjo6oB2
         IPc/H8eSYvExzgzle3BGOhIR5skwPy78yqz2tLoLhzgjtOUhyBZgtMuVZOc6rBCTQeom
         IO6FurJCpCZNlL61USr9jJasgR0PPPL0PiHFT1vgPyWhLUghegvSHRBzRn6PN+Ur5Vis
         4z3g==
X-Gm-Message-State: APuU4Z+5fBHT7pxXZ4ACriutujqVsfequxYSOBYdcgGcywbZgqRS8T2j
	eNukX1Vwj2GwsBAxhXlVMYjHTrpl8uTmcMl2lAFW0QUf7WHLjXydIYMVavL+TUYkNx0gZV4ARua
	TB5ltMheMNURvzqmCmYNVAnAh2zXxCnahUyUspbphkEsz0PypFe8hBDLb5Wj9J/iz94BlFAabGo
	vLNQ==
X-Gm-Gg: AYBFou1s/N+aDiRQDb2GYsuTtbiQF7emsUop8/KBD1LgM0MFfpAZMQC0S55vE2qYq7g
	+PonIW0k4X7g6J0xFA/Q8j65N5ortCoFdfEgWsvHp0NRIZkSJur9g2cNfEtiwGJ4/KugRc21D9+
	pgQFrmQl7U95GtKLFLcifgcoI/+nxKWzdMxQqvtfjg9vTENgeOsWqoHZ67yLOSa5S4ZwoNc7Faw
	QM+OgRYl8HY0jFAj8M/Z5OmN42U5HnItyq6qy8byP0FdBP4FhoYA0w6rb+hM9scCHl4zMUAX/Cj
	ghgcng4MhTN6pyPDhXzXGGmYlcAwkxiPM1jWjAFZ2KoVx8okOY3OawVUxL3Ijs8nGk0vgibc8+x
	5UcOR5WK2RB7XTkh7/fqwQF7x5UyBYNNhR3XwNpSUeP+NxB4tVKhGXkOhNiVXeoknVumWA0bbD9
	aZS4CEiffh5D9BCuIkZ45bWxRvF6td4BB3T0QouUqrZw8/ffwUAjmjehiOAmvNFg==
X-Received: by 2002:a05:620a:2913:b0:940:f224:5a6f with SMTP id af79cd13be357-947b00d176emr343497785a.71.1794401869089;
        Wed, 11 Nov 2026 04:57:49 -0800 (PST)
X-Received: by 2002:a05:620a:2913:b0:940:f224:5a6f with SMTP id af79cd13be357-947b00d176emr343494585a.71.1794401868539;
        Wed, 11 Nov 2026 04:57:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae09224efdsm11404861fa.14.2026.11.11.04.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:57:47 -0800 (PST)
Date: Wed, 11 Nov 2026 14:57:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 6/7] platform: arm64: lenovo-yoga-c630: Disable the EC
 interrupt while suspended
Message-ID: <knzhjpgeaf2w23c3lbqvc323m3eov6x4u766kdadx2yjgdqxo2@6vhheebov2jt>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-15-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111115303.3749380-15-ardb+git@google.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX/wcXdsSIAjmR
 T/tbCRPjCQPKGm1c6MQMVafm8pyAMOLtLXdpSk9UmuKKy25dtTDcChklfbky0ZtTGyYWVg0wg7d
 bj2Ml7Wxi4KI41+mOJChWtXpuJs9hWyGvhHLWKMTz5YG6L1MvoqsBlz5JYdaDE6yBSDi9uZ6bRB
 HSNskISv8L1VFBvWIyhifZoppmRUDS1uhrkBKUfABx9pEk6+2mY6Y8E6TV0cucfXoSGHupZrUfV
 lOECFin40jHSsoRORM4Bwb0TGrMqnWMu3WMGgvFFc6E8XCDDCHwFpCBOeJXvNOcma+uK4DTnRid
 sSs3uA1vLYCUblKQ3Li2p5GvMN6nX77/pavcEHkv11S9lZjut+s/RlE13hvxP+x1cCaPA6hDcN4
 iwdYHwDxN0qMdVD9+G4aR2Z3F/ViCXAD8pg5ENNvcYfwK1pVOTNzFC/MGvm/PKVneDI6zDFyw2E
 NWQIe1aetMJE9ChMtfg==
X-Proofpoint-GUID: odIZ-Me2-xOTVi4oip0Q6i8Y2QjSYpwz
X-Proofpoint-ORIG-GUID: odIZ-Me2-xOTVi4oip0Q6i8Y2QjSYpwz
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af4664e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eBQPph94G04ItlpDKAwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX3W2l/QBvuI19
 VuUYRQoNK8ol/NFJ9S64wPlxEBGQSXHEgbvRDahqdpTizIrTegpJGp8GjDwKkFjF8y09U5ZxZE2
 7x6mnbOmnsMsOxKJqYSgRJaMuT7r1XA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_045750_660340_C74DA93C 
X-CRM114-Status: GOOD (  19.62  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 12:53:10PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The EC interrupt handler reads the pending event from the EC over I2C. If
> the interrupt fires while the system is suspending or resuming, between
> the late suspend and early resume phases of the I2C controller, the
> transfer fails, as runtime PM is disabled for the controller:
> 
>   geni_i2c 884000.i2c: error turning SE resources:-13
> 
> The handler then returns without having read the event, and as the
> interrupt is level triggered, it fires again right away. On the Yoga C630,
> this shows up as tens to thousands of these errors in about half of the
> suspends.
> 
> So disable the EC interrupt when suspending, and enable it again when
> resuming. Pending events are then handled once the I2C controller can be
> used again.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  drivers/platform/arm64/lenovo-yoga-c630.c | 34 +++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


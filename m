Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A24F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wUPVEP3M;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EOoGQr38;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J83dhJdV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ad4h0wJyIiViI+9hJbiLak5LoWbaFHwfvyPe7w3ekM0=; b=wUPVEP3MpM054ZfjMKWVQZGBHw
	5t5T0gyTV6kat+JO+TWJjCwtt1AH1W0rS+1N80+i2p+3KaIBS4uh1o2C65bCGkxlcoC5AtsDW/mw9
	riI5uFvHgfzM1VeIhtaQIDh6wjEYcWTw8+0DcysdSkRBYq0xI8z0b36zcIeNYBP1QuJU5EvG4LXbb
	OlBgS1kCyHEQBAfVM3X+kY6p4Q6k5ULyVmlru8Qt9R09axbnC0EB7frPlLwTQuu+R6BuocOl/x29I
	pqwcM5+kR/4rUsDGoj6h3lPQ8/4IjI70nFwdIQ1OjE7lZYa1hysl8Sm+v687j++BPuCYlcp+Vq1RP
	JrRZ+yxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7sA-00000006jdx-04N5;
	Wed, 11 Nov 2026 12:56:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7s7-00000006jdI-33ai
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:56:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZUAb2002100
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 12:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ad4h0wJyIiViI+9hJbiLak5L
	oWbaFHwfvyPe7w3ekM0=; b=EOoGQr38r8lZ5ngTgdTSXrBTWm0mohr8VVJE0Abc
	ekrq4b/SNRhVK6MQ2PDMUwqLNBRFh9L/W4mSzvO5WRIp2qCEQU745X3WTC2Ewn6A
	+9fLMovA8b/n+ga6+WAV3dRkbYbJMx2PitkxXMx1/pBxuvzY3RSEL4Zk/3clsEtp
	60SUQMWk56LQdQlSRyJ7yHl+ochr+solJK010jq+TPVwb/oXujB0WOxtetKzArCK
	4yZjS+54tz+owNTXfsmjqiR8h7Q9A1RWvs523gjcxfuyjTTaV4pDLXi+VI8x0n7T
	jWAIZY4/jLdwTNL6a9Oc+oBu8WqpzdnmslSRbhHH9lMQoA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh2p99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 12:56:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-947a607ec40so174804085a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 04:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794401774; x=1795006574; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ad4h0wJyIiViI+9hJbiLak5LoWbaFHwfvyPe7w3ekM0=;
        b=J83dhJdVm9JRflAd79j5zjESp/R3CtjZu4WM8SdgFv1RCedggTI4AuEkBOjQObYC7o
         U3+uRAPSKzf+ORg6vy101SfiVU45ZDD7oRLsUIUadYNqToyohs9gIK2ChTT/rNEtQE86
         Q8l+4LP3W87Vu7Ckl3WybRjJKwZaMayGVhSHo02OGY7icBDKBZcHMyo4Km/0EJsx+hWk
         re3zGp1GmnNoaasB036ZgstL2O2YM1CErLZqOo+smkjhocuTRWmA1pqYme9pgwLI/4YA
         lNiQJp9eu+oJKv0OVB/+64UAk5hCX59/KFW5H79B4JNkj4UWA1lrvIAmw992dTAdYxWE
         znkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401774; x=1795006574;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ad4h0wJyIiViI+9hJbiLak5LoWbaFHwfvyPe7w3ekM0=;
        b=dgL2DeEJMZiFoop0YocLl7igx0f5xBnQtWV0E10X7sNuM5EBnzs1DLUMjjNsLeuXn5
         5NX+KZucH6C3L8P9Wq2w9n4DhnIpbsKLEBWy8QDgHtjXwrqBekw5Gt553ztgMotes7BQ
         L8I87VDcmhKDtEU8SW79kXkMnVjSqm/yFn8VpHQXEESzMQSlnfjAOJheDimOEARRHEGa
         RqFH/6WLPgA1cUFFEzedLxTmUeky5KsT086vVuMvDLnRJSO7HT6ouW1yWLG0Yb5nXCEZ
         XB7/NPckReC5uGfjJhHkcMB2n50N1YxrJ5B9OCfpbV2vcsNDnYlbRsXRNQmAHgCZeYkW
         VQVA==
X-Gm-Message-State: APuU4Z+fRXEdjDbZurxHH+77+sDvN9ZMuSnDh9A78HvSJwEUDqLfOhiU
	pF8Jo4NVA0grozSgogFxhMDDB6PPBdyceV3StcujNxsxm+RPKxVq5bVt5FhhuJgqglG0c3GJ8Qi
	Y+SzqQ3f/efq7MY8IlrIdII23PkyDAsQiapHTkz1iSg2bSCadV31yKH1yqz1ctVqdAv1CHnsVvc
	2Xkg==
X-Gm-Gg: AYBFou0ua6EO1p+gUsBtqWNIlUYW6MUV6CcNnRRtw9BrI3wpLHayVVfkvFAyIMfVRIB
	Wu6g6RCJMbBsZU1u1LUK9t3AKVNZVkbhnWQB3lG6rFSTtdRBnEZfoXbMrtUst1p0SufigibkEVO
	BKQTPKLgHnZBhG4dx7sIyq2Tv/Piks7GCkVkjCZZv0kQJ6GoqRpx0/E9AhWga4PgbMVjejBsIn3
	LN0W30P862Fz+O+oHGHDdYeS5LHo+dOlLk+cgXFsiGqiJOtd6RVg3DxvQUSkuMTNy5/z922fhu+
	PXEsIf/JCJqwqyZUalhy+KfAWRHX99q+QNaFyOXOhMaUfw8jmt1OxwYVs6sCSdDP3Wke9pQBwTI
	ww8EAGtOmC+4wsuUVFnq1zzThv3xX0CLrgo4dGQiglQ2sLyAR92i2AvEVkiUcQQqPwCgFakDl5Z
	gTDV1Qf7II7sWrXCL6z9QivE2mwIqZiMApfGh2u36ku/r2bAvqT9eewjxsHoUAyQ==
X-Received: by 2002:a05:620a:4626:b0:93f:237c:1019 with SMTP id af79cd13be357-947b0008839mr373464085a.62.1794401773715;
        Wed, 11 Nov 2026 04:56:13 -0800 (PST)
X-Received: by 2002:a05:620a:4626:b0:93f:237c:1019 with SMTP id af79cd13be357-947b0008839mr373459585a.62.1794401773202;
        Wed, 11 Nov 2026 04:56:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae115a2e05sm4886431fa.19.2026.11.11.04.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:56:12 -0800 (PST)
Date: Wed, 11 Nov 2026 14:56:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: qcom: c630: Use the idle states from the
 ACPI tables
Message-ID: <wbvkoyspzusw37aftgx7r6trfq7xdhib24sqijgrm6gowsnbos@gehfvvpzua3h>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-13-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111115303.3749380-13-ardb+git@google.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX+CCcJJWhOtKM
 R6N2RVJGSHjuRSmb3MGZbXlTvU4MEMiqwJg3BYtcqk4DEqS1F4yDJfRoYYOSWXHda4pMtX2WoHZ
 Dc3lHUPwjfwEwVtnycnNDsckjW7D6Nw=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af465ee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mx4ymb323s-aB6Ux9hoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: BurCIrJUFkTc6OMR65H-r68iDUQcAoWp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX0xaluXrCkWDI
 /oSxYaF776moTD7s8bmbta7kUeVsM5h3n7idEmKm7VXNH1/vVoK1TtDqqIFGrf1i7mCeCXKe6rY
 b35FdUNOfWIhtTb3jbkNsC1lUFflLfREewsw54cD+1+7HGva4G7V8WNCjdPZpizkovT++3vsf1Z
 MuRbGa7Le5+/8Jg5hrR1gsWGn1kaVbaBf+IYFo7tKCAZJkqtRdwPy8SaYSGCgk4pTxIJP2HUcEc
 DuQ6ecXfWZVk/rTidKdkdTPkcXfhiqnhMHp4EhFx/CWofIWZ2VZo3AbSubsjlDjl4TlyUfq/m+K
 kq2prSSHr8ub0J7kEaBTGBGa9whmDgDNXdQsfBGZ9WZAiKnjAFHlyj6x8+zo4V6VQGmu3xd/SLU
 qzdLuDC49jyx+xJlVi6cHdzUMqxBu3kwevwwbHxby2LdYWV37OAB5UzD6ko8Sly19V7v5sT+Y+e
 3tJOmJLzKAV6gxG1dGA==
X-Proofpoint-ORIG-GUID: BurCIrJUFkTc6OMR65H-r68iDUQcAoWp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_045615_882095_BC6C22C5 
X-CRM114-Status: GOOD (  23.00  )
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

On Wed, Nov 11, 2026 at 12:53:08PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Commit 07db10de262f ("arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower
> PSCI cluster idle") dropped bit 14 from the PSCI suspend parameter of the
> cluster idle state, as the C630 would occasionally reset with the sdm845
> default. However, the firmware refuses the resulting value of 0x41008244:
> the cluster power domain is never entered, in EL1 or EL2, and the last CPU
> of the cluster keeps retrying instead, including during suspend to idle.
> 
> In EL2, the firmware accepts the sdm845 default of 0x4100c244. However,
> besides powering down the cluster, this state also puts the rest of the
> SoC to sleep (LLCC off, AOSS sleep), and entering it at runtime while the
> display is off, e.g., right after locking the screen, makes the C630
> reset.
> 
> The _LPI objects in the C630's DSDT describe the states that Windows uses:
> on top of CPU state C4 (0x40000004), the cluster container has
> L3Cluster.D4 (0x40) at level 0x01000000, and the system container has
> platform.F2 (0xc300). So use L3Cluster.D4, i.e., 0x41000044, which only
> powers down the cluster and its L3 cache, as the cluster idle state.
> 
> Add platform.F2, i.e., 0x4100c344, as a second, deeper cluster idle state,
> which lets the SoC reach AOSS sleep and CX collapse during suspend to idle.
> It differs from the sdm845 default in bits 11:8, which are 3 rather than
> 2, like in the corresponding states of newer SoCs and of the sc8180x and
> sc8280xp WoA platforms. Give it a minimum residency of about 71 minutes
> to keep the runtime governor away from it: suspend to idle always picks
> the deepest state that satisfies the CPU wakeup latency QoS constraint,
> regardless of its residency.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 25 +++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


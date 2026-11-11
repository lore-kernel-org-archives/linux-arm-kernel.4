Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F251606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tVAoJdhV;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H5y91yvt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BDEs9k8E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/UCd5VJwmYZ8AsAXEyxlvANKawnH+3JUytHywqOr4QE=; b=tVAoJdhVd5SF1vLF8wqcsgRZo7
	DHOMTrdKbRrhE0qnKzR8f/REGSMFnh9FZYjINLB+wqoyvuCpYUzx2N6Oe62L32M+Om2w03BE3dfG4
	UNyAOKT+RhU65Z3EEf+QCJr4qCYpXjiGhcoWVI5O3d4oB4FlU6oqJPBlmR7IuwKGJAMFs157nwf3b
	DQIkRx1umy2brT7FSjkp5UBagBYts+GZWFgXVDR/HJN1iupn6cUL2YdNskyg6jCa12ywBeJjWHTus
	l4gixLZ2SmtoCTLYNh3DH90rqMQQEbUif/DWFkvgMXCLsE2r0doGlCKa6rN7udsK81NDRm85/QsxM
	9F2HKYFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7su-00000006jr7-1XmC;
	Wed, 11 Nov 2026 12:57:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7sr-00000006jpn-2r5t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:57:03 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZ5TH2974969
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 12:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/UCd5VJwmYZ8AsAXEyxlvANK
	awnH+3JUytHywqOr4QE=; b=H5y91yvtVpwTu8MwGWjVhVjHs5AxaCuIpDQhyUbb
	5ltwCIVj/KYME8YvFz3xJ+dXrlld8Y+NipFbHhIpX7BwFo1LqMan1gprvo6I+Bfi
	i4HkxBW5s0dmSGX5NjVsR+LtanT2/BTGf5cAO4upiEVDhNm3J8M5iXPbAfKAy2Yt
	U+022EiwzRWxRpiyF1ZClRWgWAknZvCNjsaaQAyOgTwEMc6+BNIrvWW2tKbNld/P
	Hf/ZdShxn/zQrHHkgstfLP8WhRl473Dx5cYWD6RHnmCbVdG0suuuswx65lOYSW/3
	Cat1NM6YNu3TP9CV+Fy/Tw4yy9dmBkysLrqknobggS8VYQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cbux5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 12:57:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so641364685a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 04:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794401820; x=1795006620; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/UCd5VJwmYZ8AsAXEyxlvANKawnH+3JUytHywqOr4QE=;
        b=BDEs9k8EyFLV9yx2xTLLkZMjwUsSMZitRoWf6TpbuOc+Z3Wl1BULj0bAlUGVBsQ470
         himQiZLMXe/mnIKuQwdgM0i5CPAwfWmIIWF0kxFdrtTEMvybPag4u3ktKbUzscMmpypF
         eNneIAvrGBGakLhs5NYcRxerN+fiQFpUesdwB7gs9/v1sspU08PpPeRytm+ZG6cANQwE
         d01XWKIyzFhIciIDYt4mwjAuoEOO1Rn6XIkqalbVl95qwzcpzmvB5A5U2ZNfwlQ4TJsG
         N/LMqam4EDym+Awb1hAdrJZq+Em3uhLiUf9zILxcdX6vu5jYNRPT4QBS3QfT+y6SDNbj
         na9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401820; x=1795006620;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/UCd5VJwmYZ8AsAXEyxlvANKawnH+3JUytHywqOr4QE=;
        b=ozEYEpwwyJIJ8kBGIMfxuKdWY8KLtIcfKDSN7qQgRl8piFg2VjmpGFsif0S92rjxrQ
         VdWzzWaK10xHy+U+iVoLivlnr5/Ep+UZUFhJyoIX9K/lTDm2fh9Sm84b1BAuCI6W3a6f
         SfSj3pFKFL+JWbq1SqKmM/HCjvOcYPQQah7A6t7o7Cptdz66zq6cD0oFRrdMg1R2Hp2W
         aub894Pdee2Y0Ey+4lBFUkwX/MOj9ei332rt8WAYB8x/5fQ+j89abggE35Tx0/DZDWsk
         td04HJ1MrW0IQ/YDwNjo6W478cpzNHWooQQL0mG58R891fOyYA3mo2auqBnF3bMZNebH
         mMng==
X-Gm-Message-State: APuU4Z8XUf18Gw3SUCvsvviYlTovC6xOpdBnd1dfKGp0UEE415TQGBGh
	xBjL4bMDz5TkT5t2laLQPNSWTpUllVyBMEpfYC7qEXBlq643yGDwfj1fwNgtYQcTMek898LXQQd
	xWax88X/O13zCI8W+YNQwLbjrgd68Euj9OeTQ7tPRdRAzmvV64u5H5ae8cxNB4FT5fqD2HGvrPi
	d4lw==
X-Gm-Gg: AYBFou3NSK7DROxQamOc3pXHUWB9hBY6gbSkKlL2nm5MR92p9LP1272HuJe4JpuQnjG
	smD/TOsSFLywa3WQQmXlbmtmUtZgRpTSsBot34WgJGx6E8a9NnfF1vG6TPoFvyjPKOmm+AuSAT8
	xM63FuYJZd+0gH1ds5JV1vgSetGbQw9my0HbTw0OU4gcjfFUaYEVi3LXCAhm/+31qgJHKcHwdL8
	WSsrrPylk8hFk3+wu5ozCrEkZyAITJSo8ntaIjuIGH6S2QQGzeWDyNm011d0m2EArPKBLU7Rnl8
	IAfhdP0/NB7HKf2Sz8LdKQhf3Epbs+0iDXyQ6ln/4sNaFC/UjpXsKV1FtnTKov3dWe8R7q99QXh
	yeMG2BQsrVITWt6ou6jFCktVZwunm3A6iv2bebl6VPfIWmnOWXSaaL8ueCHvDeHbKH6tR5H84+S
	Npac+A6AHAIwQPNqNVn9iGzC5e4k7eCamT2h5v9BcNGrw4JhG+WLHHprlylqlZpQ==
X-Received: by 2002:a05:620a:8003:b0:93e:4b3c:19a1 with SMTP id af79cd13be357-947b00145edmr326012685a.44.1794401820111;
        Wed, 11 Nov 2026 04:57:00 -0800 (PST)
X-Received: by 2002:a05:620a:8003:b0:93e:4b3c:19a1 with SMTP id af79cd13be357-947b00145edmr326008685a.44.1794401819547;
        Wed, 11 Nov 2026 04:56:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092896d8sm10581541fa.32.2026.11.11.04.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:56:58 -0800 (PST)
Date: Wed, 11 Nov 2026 14:56:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: c630: Wait for the touchpad at
 resume
Message-ID: <zdlg56mjf43oaikozce7z5vneljg6nhk65vnqjiuxk2lbw47at@udkacgf63g6g>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-14-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111115303.3749380-14-ardb+git@google.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfXxvxIL7aDQKOl
 lSFIxr96xbt8ZXmc2L/L6SOrTwXML/bg5AOIet2lfCiWXNhsPAbh4nAF+09gvReZANv+BILM+zb
 YS5HJyuVqEsJUwvvwOriJt6V5y4l6xdNV3Gauccx6srfVLMU6nCADtY3ckjLqSIJRLcAeoDkt0t
 1PJkZZkN7o0o+bB/mnVKOH9bQc9+FF/GibjDFPV4hqjbU8ZftHrf7M1zbCbKMAYSjOAQ6QI4uBV
 mz/QZkI5LxMVbUOHT2Qs30gtRzsAnbfaBgZBMaDq46Ok17wylOP9EeDNSu7lF5hJbabzW3n02j7
 iezrLP/N5IaemKNSJ81AoFiETlhbps3tHeGIfHTIWaxcKN8oLd/VxS3Xzj4SQNdl1MfXe5XRAJf
 28oeb2OxRWwFu4aMWRj/Dvl2t+39NXQSFScixE3w4S29pX60MAZNJz3eK5jhVrv3h+63sla4UDK
 AccHN+uK0fyc8b+JKoA==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af4661c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=583wMx11lFD8vOOkg28A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: rWYdYuNkDPdnTcT17BVZYEilPzjRzPwZ
X-Proofpoint-ORIG-GUID: rWYdYuNkDPdnTcT17BVZYEilPzjRzPwZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX+jDhhjJPIkD+
 w7PKp+kWtdicQ1yKy0+E9jhp9MiHYbgqSd5fi1tnEroJsZrjafJV7ez7chB4GwPd6htBkkgXiQO
 IJf2kw/sswnUmxDdkY+3pYXjxq6vVHs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_045701_838929_23A44C60 
X-CRM114-Status: GOOD (  23.10  )
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

On Wed, Nov 11, 2026 at 12:53:09PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> When the SoC reaches deep sleep (AOSS sleep and CX collapse) in suspend
> to idle, the touchpad is often reset, presumably because it loses power,
> and it may still be starting up when it is powered on again at resume.
> If it doesn't acknowledge the power on command, i2c-hid tries once more
> 0.5 ms later, and then fails the resume:
> 
>   [  712.566907] i2c_hid_of 3-0015: failed to change power setting.
>   [  712.567528] i2c_hid_of 3-0015: PM: dpm_run_callback(): i2c_hid_core_pm_resume [i2c_hid] returns -6
> 
> hid-multitouch then never puts the touchpad back into touchpad mode, so
> it stays in the mouse mode it starts up in, without two-finger
> scrolling, until the next suspend and resume.
> 
> This happened after about one in eight suspends. With a debug patch that
> keeps trying, the touchpad answered the next attempt, about 6 ms later,
> each time it had missed the first two.
> 
> So give the touchpad a post power on delay of 20 ms, which i2c-hid-of
> waits for at probe, and at every resume before powering the touchpad on,
> as the touchpad isn't a wakeup source.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B71606A88E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FsvLeuA0;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TJrFFQ0r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OiWB6DXx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xLuwRiDMsAgYyoDLM1JuNXv6FhFKAvRWcgh5bebshE8=; b=FsvLeuA0PoF44f3yGgXdrW5nfl
	ljYc3tVgF+C5M0esbAWfY1pv8DXLGlOWpvkyu5brWAknxOQ4ySSDGyp36GIJgejN/HmqLeg0vq0JY
	3x3L67oP7Gm7lpwYdTBrhP1zfr6ssZ2n6VQGJ5ZPK794CxU+veH3ucQtImoxlVf47yBGbnTiFZsJd
	VSpMu1d/gVQtDxtusg/JU+aemeG6KtmnDbtQHPSTTlSdvT5enbg7iR0LpzINkONj1Big3NTvO1EDy
	gqa5QQYhoUXE/WxCDHbpRI8nZ48nINHgdXcWLRglFw92vXcxtZw94ksSp4yjqRmzreiAAc5PIX4zW
	d2InMjQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7ue-00000006kF5-2oEg;
	Wed, 11 Nov 2026 12:58:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7ub-00000006kEI-34Ep
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:58:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZGQe300962
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 12:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xLuwRiDMsAgYyoDLM1JuNXv6
	FhFKAvRWcgh5bebshE8=; b=TJrFFQ0rSub7muCL5DHGXg9hQAqY4VHCh/w3+oHn
	Aeww2uX7KmlCGB1nnekypgagvRYMyQa/TIb25yLmQHoy5O4/7qallKntHxPNePHp
	y80yCV8DajbK6/oBH0nBeXR3N1L+afIat5KTdxW9CxFQlC+wL7IU5paAfZsHaqGm
	g3o7mksvGykhk22NrDRcLSf90T3iu0j2HgU6im8E99NNIlckDhtT9gSCYELJPuHa
	9uXonTX1E2HrO3GQn8p4eBU/Him7YIjL3C2AUKmk+iJkXUPcNeNEu3+QkGp5I5U5
	0UCw6APYF4eKeak+xj3RRB4cVV2/xR+5xo/wfdu+8ZDyiw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjrjrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 12:58:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2373e9b4so386187685a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 04:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794401928; x=1795006728; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xLuwRiDMsAgYyoDLM1JuNXv6FhFKAvRWcgh5bebshE8=;
        b=OiWB6DXxPzBTQGRaw3N7vOa6cVuT7AfdTpy8AWkMfFeRKl3sMekQv9QulDHe2n2xqK
         WVJbmYe8umS+63g58pCaMHoFtlh9h/Yo1s9bkYWf1whuVBP0+gdseyJ2X04twgS2XZpR
         kBX6BRWy2Y880FuBsyrmzqDUTyRpVkB4eD/D1Hk1NUZvBy/KeL5+AyHKbJo13KV2FCVK
         eg7Q0Vek/w7NQTMxetZZ5vW+MRYsCRqHDwZwNHqGNNexYgmsm+HJZJmk5Ty94HujpBLQ
         568wdk+rwClMAoodE4sHxbReR63lIaxvcsTw7hjlUqVrYMPcyGGfyuJXed5Tpw6gw6Xv
         QuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401928; x=1795006728;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xLuwRiDMsAgYyoDLM1JuNXv6FhFKAvRWcgh5bebshE8=;
        b=Nfu3e8d4qWdFXr31oJnHzPHP6GZNGUXL587u2mmoqr1FvIRUTlG0GE4TiWz9Oj0k/5
         ZyHlBWUmB2ZhLwLqGx2RvDUthzFeUEH2Z3BYl9ONVrBDo6zCDi1Z68rZC7Qe380aukgn
         souHNHpySRmOUx/r8rTzhYs403YB0S8K0yQpPLtbNMyUkUeGKtZGKKg1Lk+cbc2UfZm3
         op/AWsjkOlO0yihCNrmBw5Dv8Ch29zv4TgVwdK5U23HoqwOiakigs8rRdloqXoAgCzKJ
         k4SK/mcs6geaxyosINkAKcT3PE5nTk7AHJVRY1RFnaPozlQ8/WmLEs8P/gKfuRjyNCbf
         UkvA==
X-Forwarded-Encrypted: i=1; AL+hErFw4uXnX006ChtMzZhsDlLOoFeFkt1hsF3wH/eUxm+oPMlRgPXNFPwnhQ5yueG+UNJojEJnmMe+WKbH2zGshS04@lists.infradead.org
X-Gm-Message-State: APuU4Z8euJ5xjeDg7wVW23XSx93UCmUop7yAl+5I7+whUq13FeWdDpKd
	XSlPCD4sojt1nktCY+SY4TkYbiDwj19H5jOCRMwr2CFy7/e1I3UJuQCt3TOW2lXEL8+l+HuyAhZ
	ahQmZDV4VkCVPzSIb75Ndsd/jNtvv+SArNgPsmE2d71zXHS9JFdgq2rXgo0cL1DCUYmEFSP7BYM
	udwQ==
X-Gm-Gg: AYBFou0qvfuHioE+z4+zeniBaxvcdHx0QeypyzZMVXmFR8Q4vwP10Z2fR9RX+nTtdE9
	L6Ue9AK5bnWFgt1CHslAFZWdlgvJ4lmvRJ61xOlVhYQ/7oIrPnKyyh3D/Xudqat51K9nI5OstoK
	RXfxnkkAt7QHWHGz8sm50SUFdwb6XI1jtkDKWl/GrEQhbisUeMUaqXK/wgAJ8e/47hBR6+WFwF3
	52lHDIB1OZQNUy65inXnC+Di7QSr1hIb6exh/sLIQ27kDz5ymJVqa0BOo64V5ElevqrhWO5Wux/
	Lk4Qe7wQswllagglGclQLLyZJZjXpolwVLp3zlpRQNZN9ApyNnEd40BWwWTtmd2mJ9P1KBsLfHx
	G9w+gFuriZh1zIOw7GUnuKDvXdq9khrwF8mRM2erfKyZ3b3Yu2CUSQljv+iDJhkhtsHuwgnTbwh
	fR/1F/aC9/CYEZ7LE9UOlZQjdTMOjF8KZE0LDlftdikS1wUe5bCdHVcC5atAq80w==
X-Received: by 2002:a05:620a:1b94:b0:93b:d7a2:dd2b with SMTP id af79cd13be357-947b00082bfmr328476785a.59.1794401928045;
        Wed, 11 Nov 2026 04:58:48 -0800 (PST)
X-Received: by 2002:a05:620a:1b94:b0:93b:d7a2:dd2b with SMTP id af79cd13be357-947b00082bfmr328474685a.59.1794401927556;
        Wed, 11 Nov 2026 04:58:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c160a78abbsm251946e87.43.2026.11.11.04.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:58:46 -0800 (PST)
Date: Wed, 11 Nov 2026 14:58:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: c630: Wait for the touchpad at
 resume
Message-ID: <vrdpknallpy43dxgkkudqokq2cykm3ryfebpf2oesyfbs53k45@jx6hp7mglchv>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-14-ardb+git@google.com>
 <77983ae3-f4ae-4b52-903d-d5341ac0e869@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77983ae3-f4ae-4b52-903d-d5341ac0e869@app.fastmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfXwAxhjQfRmp0F
 twFOylseTV0FoKWRLU71R0zzZ43IOVJGxqZJ2BBIfUcLp5gRyjxIP67yPqJ3ZHyDVWQ/f83LLDy
 nB8VMfq/x3+oW+qIorTStJBAo/iFj3EwF7Qf84BLI43GYKjKYYVYByr9YC2biYMHgIH80x0nCJn
 bAdg6mAZ4y2k7VaBGwV0RLIIOPBcEJ//FC/+3qBn6fqA1lMxWFX0eyNPYkndJ+QEfW/lseu4wN3
 qQTLClHOlH9trjqB8CNiFwQviXjni/yCIUIYOVHNKVzRVeQH6StnuERb2wjbqjepFGZHyjoahvv
 u21teN4fhAuzzFBmHtkMXOKax7gT24PwVmoXPhS+MDic9ub5BtjAikHh79LOENLFgygDZeVsn93
 SntMpA+JShe9lK9XzGn4kHiwz2DGFK3g8wRcHpaFg1jjraketELPfte436RmcAOWfRnkofCnnaI
 Z+xhxulSLD6w01WD5BA==
X-Proofpoint-ORIG-GUID: b6xygKRAcafzfmy6UaSIneaYZCYjkfHh
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af46688 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=Pd4HU63dYYUIdYn22FoA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: b6xygKRAcafzfmy6UaSIneaYZCYjkfHh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX66EjbXfnWz3W
 A8/D2gXo107LCtoa9bfoRvAJsrrDp/THZzAzXFOIMhsrnooWI7pJuYngCbvYdipBpdctiezKLTO
 K8RefUMzAXKuQE3C7QH6FIbEr8kulzY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_045849_886819_A12A6BF0 
X-CRM114-Status: GOOD (  28.52  )
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

On Wed, Nov 11, 2026 at 01:22:35PM +0100, Ard Biesheuvel wrote:
> 
> 
> On Wed, 11 Nov 2026, at 12:53, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > When the SoC reaches deep sleep (AOSS sleep and CX collapse) in suspend
> > to idle, the touchpad is often reset, presumably because it loses power,
> > and it may still be starting up when it is powered on again at resume.
> > If it doesn't acknowledge the power on command, i2c-hid tries once more
> > 0.5 ms later, and then fails the resume:
> >
> >   [  712.566907] i2c_hid_of 3-0015: failed to change power setting.
> >   [  712.567528] i2c_hid_of 3-0015: PM: dpm_run_callback(): 
> > i2c_hid_core_pm_resume [i2c_hid] returns -6
> >
> > hid-multitouch then never puts the touchpad back into touchpad mode, so
> > it stays in the mouse mode it starts up in, without two-finger
> > scrolling, until the next suspend and resume.
> >
> > This happened after about one in eight suspends. With a debug patch that
> > keeps trying, the touchpad answered the next attempt, about 6 ms later,
> > each time it had missed the first two.
> >
> > So give the touchpad a post power on delay of 20 ms, which i2c-hid-of
> > waits for at probe, and at every resume before powering the touchpad on,
> > as the touchpad isn't a wakeup source.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> 
> Please disregard this one - it doesn't help in the end.

Are there any additional power supplies that might need to be enabled?

-- 
With best wishes
Dmitry


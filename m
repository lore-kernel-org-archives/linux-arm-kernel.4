Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD3A606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MTCZM4e+;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mUkDTENG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GWl9soiL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/GvGp0ikRhYCrmCcfVEdjux6pBM8MsB+KXbne/7lAoM=; b=MTCZM4e+f9k28m
	Jv6A9scstBOliDYR83iL+K0T6TKgLqmOm+hUcPingwGiZkSEpNtv7T9EwUTNyCBDwxXpyLHf9DY5w
	XhzVh5W04b+HTBSqF8uNnw9/ho1hMTgUdx5Ry5JMU3k0bAELkR8VwUmSU3mxpLoqwIGTuZHpNJPjC
	hPgpxH317RiMBW6cMabcfI11SkHJzTeMcxXqAdhExd+bHMgujkLn68A1vgEpPHMmFO0sOljyy4PZ2
	hNEsRNWIerFbsRXFQaWy1cMU4QjlhrE/AxnVaOsdBS61ea4Yk8wU6YcDuKMsZDMkZ2QbMMk8CXm4F
	QWhoHH1k4412wwsOdXdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjVD-00000003Wu0-3mAd;
	Tue, 10 Nov 2026 10:54:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjVB-00000003WsP-0IUl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:54:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lGq92240849
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 10:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/GvGp0ikRhYCrmCcfVEdjux6pBM8MsB+KXbne/7lAoM=; b=mUkDTENGYogoUsvm
	c5dhKSLCd9QM91OJxfv7P/41BMyzplzxuqEIQ4Jwfu5jYTWHF7U1Al+4NPkDOMmz
	iga3w6m/DQz9x05Hu9jEWUPSVj0DQ+pww6XjtaK4BOzQJUUQzeMDbkvSWP1xCfQb
	0cmmsd+uwojsqcaxuywdQYFC3RKSaQSJySWIjUGOp0+hQz/+wGFAqiNu1IAv2scU
	DT56nbSTh7LM7nsybPDfJ7QOz1+gsMP0gKCTjtD8FAsMH8DKtMf/47ypSaKhclJ6
	Ld69AdFzgun8lHVDOU8Z/NTQ4NFao5unLvq/FfX3ryDlH1sx3lKBGP4vLqhuDSO1
	JmnEcA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp1mpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 10:54:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so1702404a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 02:54:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794308096; cv=none;
        d=google.com; s=arc-20260327;
        b=bZXI7yNJ82gh5xhI9MR7rOBKA5ZCXqlVxwhWWydlxmOEpumSVx4b0nS/jMotmg0kJr
         YjgcbiGJv5I829BGnMb06A2cBqtunm95YtqA+cnUdFw496oBJDTuChjOwWfSW0BqKn8q
         pQCekExPDiauzMQ2puAxUW4HmuKEldHgVFBjWu4JQVn6wmi2MjmAV6AwvxFa+A6rDQwT
         uiW9RRXCPem3E+qIIF2Snras/RuM7Zq+ZWLtEsLmSz2RkaQvrkUXD3lI+swX3SqWp/XS
         LISwYcuJ0nGhr4oychbniFz0IkiOzez5XHda7sC+T3VEsPP/QCYOCDHokvab2kWtZd3r
         lk4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/GvGp0ikRhYCrmCcfVEdjux6pBM8MsB+KXbne/7lAoM=;
        fh=nCvKWdUS7j0iJK/o/0DCcIK8HTU+m3rF5WyYZH14XJI=;
        b=ev6+XOYwb0fwbghoqnjNAIBDAl8WWfghENhrfEoz4nEAFNOeL9nuHo5JQeEHgo6mXb
         rgydp+jBsZoAIAcKRXF0OAqg3ogh9rOgFNV/6jF9dmTHgSaMLlcQ13ImoUXZwbF6V8eh
         fj7Yk0LLYh83L0RygBomh8kXc2VuYE1Q4PpQ3uCf7QPbbOxhHCSTx0e+TYIHxq9bi1lF
         ZpWc9HHWf7SIK9/43gA4Uyy23YXzcRJCffLWUDLWaQbbZ9PgR4pPkOLU3Er5cnLrgVUY
         Vm92+xFO9gXV8bjZoG2mXYzaoVHbpaBKyGZE4/2RnJEyu4wq0jfhHxXJJwhCbcUY+mMh
         Yx1w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794308096; x=1794912896; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/GvGp0ikRhYCrmCcfVEdjux6pBM8MsB+KXbne/7lAoM=;
        b=GWl9soiL5WwKSVRKmtpDi0m//CBQQ96GHrPi5O4CBQGjR985tVZHsB6yGgrhQGL4Dm
         VBW+1zifFOmVL6zpMBT8Bsx6GvG2GcEd9+6vn+3LCd6YEg9GXyVMlDychJBrGIhq5uEZ
         1XeR1JdlNb2Vm5r25a2OTDtbu4P5+lmYDNyqWo6vUhFC+K8v+bDW+Xg6C06VzMYwzyQ2
         jcrvTav8I9M0RwkbXO/tT2R1rmm6sq8eix9LBTkzV0R4guxNOC/qIBGwNMueFOmofTBE
         FM0fH93cOWY3MtMbmBOCGlj0gm7Zi8u9hjHc8rG7K0NUgY9wLV3yKTWBe39FKO/QIQ0x
         qGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308096; x=1794912896;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/GvGp0ikRhYCrmCcfVEdjux6pBM8MsB+KXbne/7lAoM=;
        b=YfkUPjJ85u5q19mkPmr5ljoU87CphCUcwhDbUoImfapagoCMfbHRCB+aDtKRjDydXe
         bcMVTrTQSWyArEaQmcmzUVbF6w8BB4aWs3xqE47CkSKcNC5U0wnbtW/pRmyj0/h0zB4n
         2fUE/7o4mwhovXWwisIicKGOE35IJ6g8awc+EmCQHOdykyXMFxeJY7rAm7Zs9jL1gVPR
         BRRHKu1AQ0pZCKoTGq+qq2ycP3YpdjPmT/aYCr9VLvhcZVZeGPj3vo0qnQSWSZrUAfUb
         7pRFTZWWeI1WAB1MPuJqZcyENmKAW5VCVxyy5o4YsUpwCKX2INW8KmZRlFcio5TCHZmV
         1tvw==
X-Forwarded-Encrypted: i=1; AL+hErEiOb6zogHDVYSsW/EpakGiAfwYiRw1tLNN7LC2V/DejVn/oVOEULhaBC0fBzvlFLKN0D59+5aI0kKOj9G/48qt@lists.infradead.org
X-Gm-Message-State: APuU4Z+KPQXyEIwwZkqWI8tj0qNcW4chmpMmf6UiSXceww6qXcv2Z32F
	ASmoA0bQVcqVIvk2GgbhmdSiB3kb0rZytW8Z6ZCfUBP608GjcrNl/YGxstSMvnQcOXEkj/hJ54h
	R12CdKQmoIntswL+D4QAN9aofnWHqS6nSq7JuX2AJlb5zcBR2pbeWcCJZplDeodgUNZoEdqXPIl
	hcRXDCbZrhb/d1nqtuZSAdb8z8YDSAnpPaJ7KEdY/dWS+Iy5A3TKiU
X-Gm-Gg: AYBFou2y6FqNsdc7jYfPkQNa7Y+yr8/WR/HE/je2qvc5WrZx+gt2/Jra213U7ahG2CS
	tdsMlAPNOwRlpLiKHllNmsQzrFq+t27hWy2NTXI5LNXh1EGC+3qx/bbZ/aK7FObh0LauT9tRcds
	DTBqSPJ1lGAqCrHd5391dBHgY34LFW+AKE/QwaRORVBX3PRyQ9+AnEi98fYQ==
X-Received: by 2002:a17:90a:e7d0:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3b166a5fb0bmr2419111a91.0.1794308095860;
        Tue, 10 Nov 2026 02:54:55 -0800 (PST)
X-Received: by 2002:a17:90a:e7d0:b0:3a8:5fd6:cb6 with SMTP id
 98e67ed59e1d1-3b166a5fb0bmr2419092a91.0.1794308095395; Tue, 10 Nov 2026
 02:54:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261101082307.151957-1-gahing@gahingwoo.com> <6777074.j6PcuT4dK6@diego>
In-Reply-To: <6777074.j6PcuT4dK6@diego>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:54:43 +0100
X-Gm-Features: AclHuK_tfQs_KED6YGEFdDQzYeq154VOUvxzh1aCGwTqlSdSoloobK9cAe7e-pc
Message-ID: <CAPx+jO_gRtipR7iuh0D7G2Wi25GZoqFD1JHVbJNmhd1UyC3Bmg@mail.gmail.com>
Subject: Re: [PATCH v15 00/15] accel/rocket: RK3576 NPU (RKNN) enablement
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, ulfh@kernel.org, p.zabel@pengutronix.de,
        ogabbay@kernel.org, zhangqing@rock-chips.com, royalnet026@gmail.com,
        abel.vesa@oss.qualcomm.com, sebastian.reichel@collabora.com,
        sidong.yang@furiosa.ai, u.kleine-koenig@baylibre.com,
        chaoyi.chen@rock-chips.com, diederik@cknow-tech.com,
        alchark@flipper.net, leonard@lausen.nl, jeff.hugo@oss.qualcomm.com,
        rfoss@kernel.org, dri-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: sktaukDZVoN3HQXrwgS4-xOCMf7yvJTY
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af2f800 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=HKy5YsogUvdA2KhsgGYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfX/yIrUY46Nd+B
 waiqCsC8yz5pTxHfB2ROsYIiE2cVugtzGgm7ipSLGFw+u2I1Q6UxfB0E8HHBO/SR+cP+Yi0VZ/E
 DPOL8zcE3jruc9MF0H+KMA3OY+pzRGU18FGdS3gUmDJhodSQ5NHHK5X8V+xPH28xfGt2sh9kBxP
 3HTm1r+GbwB9WMG9ohGZx/4vX8zCUTRGqLlh/QP7kpZ6g50/YL+zK9BKL930FhLS2uOGqeneNng
 byyeuLuweXR1XGg8FV2sOrBNpafvyN8BRHLL0zrlIKPUmh5GUG+zd0Sgfdb2evn7tGUzoa65cgN
 YQOJYaI80kGsMOOTseASWIaEWuGCr7ClZlkEvcO2Tu3uXjMgQZY8Cw39QEubWVbLrTAMl5z6xd+
 a1vMB36jpeTmjhhT58UtrnEyTCvyx1KIHSvguaS34dnUjE/+r5547QJPPrSZx4mA+lKmxtjCfqM
 pVL7ZdigxzPtRgePH0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfXyeREDujtLPyC
 Cqi1DgVG3H3gIHYNV6SxcU2oY3wH2pEJIFmhkIdkEzRbP/+G+IUnKBltaQAnBKglggbmpPMvK8C
 7J7VIMt4f8D+4xcOe67nNisx8T8E8Vc=
X-Proofpoint-GUID: sktaukDZVoN3HQXrwgS4-xOCMf7yvJTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_025457_116818_1B81CF68 
X-CRM114-Status: GOOD (  14.25  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 11:39=E2=80=AFPM Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
>
> Hi Ulf,
>
> Am Sonntag, 1. November 2026, 09:22:52 Mitteleurop=C3=A4ische Normalzeit =
schrieb Jiaxing Hu:
> > Ulf offered to take 7, 9 and 10.
>
> I've now looked at the patches in question and they do look good to go.
> So it would be nice, if you could pick those up, when you have a minute :=
-)
>
> Thanks a lot
> Heiko
>
>

Patch 7, 9 and 10 applied for next, thanks!

Kind regards
Uffe


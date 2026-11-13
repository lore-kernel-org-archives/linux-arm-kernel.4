Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE9C606B208
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 17:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Heau+AqS;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XLgYD711;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AyIU7C6a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XUtAykq3hDRsL0/US7WOum9GrsDms9AB2V3NWupV8pE=; b=Heau+AqS3lLYAl
	PydKZwhWGBDnImGFsFD/n4Gck3lmBoKgufdWOuJMxMxdoUtBOIUCoXR4AFYqDseerDI7k0HP4xLm3
	KjtXneyidAigY4pLXCfR2cv4a5LFvWDrkNfbLPK8Kk1Lzd4XN8UaSkcQ3tzHC8qjtsXW9u0IGPM9s
	ow+lwImqnSUAQkfrELOnYBGOE5XK6G/kclWL9Uxiov4YaHdguG8ObdMltew2cPxRQmq/OcuIhCTP9
	gt70eIKkXRbxXrXS6KCmzLCy7q+hr/BgdGJiZDHXJ95ysBeDG7wGuRzrBWx4Ofkeh0rvDml84Ckl4
	dQWGbiD8n+eoE8l4L1TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvMu-0000000DmUw-43sf;
	Fri, 13 Nov 2026 17:47:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvMs-0000000DmTY-3BqN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 17:47:20 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR6Qx1076254
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 17:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XUtAykq3hDRsL0/US7WOum9GrsDms9AB2V3NWupV8pE=; b=XLgYD711Nb6RdnRZ
	pQM/51Q183vY/GeyYUbr8tGR4RkZZkYV2YZLlpgqyAn6ep8vMEH3k7k5XmsTr6Zm
	dg4JtobSMy2N/EQQcfrNKmRJT5MRHku+6LyZ696Kz4uqWEnfZDpGBQIiY5yMuVtq
	/vvumqxB+tt/zkmIDA6XX7vwN/iLx/oPCpTqQsI6KcS5POxjqi3RVrrQzff1UhCu
	qb8l4Ow38i8jqlUuWr8EBtw+dWgLGU2bfB1M33C6drxYHw5GpzI/bDQRlKe0GEuI
	4xveG2iHz8mEJb50e8UCyeyD2PMSmP8dSapmmAeePBNVReEyHsGi+9Eo+37VDu6M
	5P6New==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0amvr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 17:47:15 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdba0aa55bcso695282a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 09:47:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592034; cv=none;
        d=google.com; s=arc-20260327;
        b=X5m2yTTovLr+uf/5zKAZ7/5WL4waV6tZKWZqcXic5ig4iPRdBN23DOA3ISZxhCg6YV
         9fDqWUcHv/XviXdJDtzQsS6kNo6WeLzIcJHDv496re+HF6X827osv6ahubadyPpLmqaS
         OWP/cWE0pxVH3q/8zGyY65QyBd1kCnOYSOOj+DFDs33fe9bMMB8teAHpsBYw5o3Eqbhu
         tiAIQNA8Pd3Obc5WLe6JqL+eAeGJxGWSIl/y4UAOg4KEKipm/+XVwdi9gI6MtJVAjgOm
         4bApo6DKO62qMkotf2MuiQ0ybVcFtJEVxL62G0t9MPs3x+9UgJdW2W+KA3TPw4oXf92T
         yWJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XUtAykq3hDRsL0/US7WOum9GrsDms9AB2V3NWupV8pE=;
        fh=QIEbzM7hs4Lo3O9KzLRM5S0sUSQHff9ge1xyC4bry00=;
        b=l0cTFhmj+fJbeC6DEvvzZ76q7hvS51zepIts3NXh9IrKmD2kt3VC6MeefbiNWxkdeY
         96u/uQd9duXwTIBsu13k4+wuI+6wxalZYYibMMDu9FaHCXtXm0J8VK8Zs1iaYctPPjj3
         7RkPz18Yi5HuSbA7ELddkxPEYbOF1gEWt5RmS5shhMEcecrgYFUDG2ZB6VLmSfOPqRR7
         cRG21JRaeXbBwu/nemCiiv0vlscn+6UgQKzGVsN8pQKviQD/FVRNIjfIj29C/VRGnV7c
         wJMOwpptPwxC02e0Kml3TqiS8fUKtfCtp3z8JzUIvMKuXWdrbbwUaJ/Z6s/7ZeQoRE5V
         lNBg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592034; x=1795196834; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XUtAykq3hDRsL0/US7WOum9GrsDms9AB2V3NWupV8pE=;
        b=AyIU7C6aRGgv8IQ2IoSus/tWmy42t65byfEedUFfRjvYaxb9SV23ryIx79/5T4xFpZ
         ctw98huX4/Pb1C7vC5c1I6JvjYUIVqzxcDe3gJnnxPa0e/eZCJUhVkXKQYQ5tkddwA7F
         WN//G3wHyl2I4M7Ilb2k8m2okvU6KBHVWpwz2dlN7H8kKKyw9jNq7lZSknjDJSJaQCJ0
         hhhVKApvfoVG2t4AUXGooUEP2yuYcqi38M92fkm2C5NnaYd1TPNfHSXc/2NXl4UQgscs
         bkJXuKIWgIpVsdMhrLk4XytzCrNLJy3Jslj7iAcsb3fQz+JbmHn4PVRuexr330ZHBFor
         cdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592034; x=1795196834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XUtAykq3hDRsL0/US7WOum9GrsDms9AB2V3NWupV8pE=;
        b=P9aCjZ44YyA96NONI/05buzcQKwwZiUWfjeW2ehOPGg5WDEQR5gxfMFMjKdaazeNQM
         AHm+oqqwwFs61xykwWq1N/yqdXqGO2lkN0KOtcTbQrWSvFDmJU0pkEAJkkwmHheT1BN4
         gjAgCSwtLbgLWV8znP7Z+66T3d7EZm8ckA7BtGb4YU2CkjKGX9Ct57DT5sXClVGkm3Br
         Y9LhfuR4EiTaL8/mKWVitayxh3yXiC+NHd0jT6srKNQNq/kcfFP9nYRfiEIR2l+pipaz
         72/5yULumiRcXRnPzUzxBrv9BrUqQX9Jp3y7SDQCTylHSYk1ZVr3py5PovWlEK17Orpg
         RSTg==
X-Forwarded-Encrypted: i=1; AL+hErGYY7Z773A8e009cA4smPxxqAr7U1JXsOvVwjeeVmHEC/aikz9PtISZvNvscAw6G5gYPTFaB6MvQboPanqVAUNF@lists.infradead.org
X-Gm-Message-State: APuU4Z9Sey9DrY0oSV7hOIiNh6sR2A4u5F2ozc9D0M9z7sc8HYkRbbLj
	MP5G4/ADrQ/j1tGIa5hj8lPAh2GM+vyurGf4H1TP9/EWTxgnPe2R+JGMg+XgrbwiHDCZcqTfNbC
	Z4ZO5r8DUZEpZJrTBXxcIKeE6XNSlYUOszp9WYyljozA/kjhfOY1tMOE313ZFcHmrtJYG39/JPC
	9bjlciAnT685EqXmQ4gIhExbMIewV0jX919hpduJmmSGeZGRipIIto
X-Gm-Gg: AYBFou3XJdDs79j4BAkzp5n1O6btbOHmizYpKgL4l3DLmMlpK0C+LP7o1GIydWkPsxL
	xTPYQ3abBwV2pDnr6p05mIcYJvh9WkM7oZFHfUR+CUE98nnyqPOQm7gN0tKQtRi0PNkAyjlysft
	pPKOTqovRfEEd/5vU7jf3QnPboqf4rYRRNSV3FIJdMqsSziiv4LB5owLI8bg==
X-Received: by 2002:a17:902:f603:b0:2ed:4456:fb2a with SMTP id d9443c01a7336-2ee0dedd363mr31379205ad.36.1794592034224;
        Fri, 13 Nov 2026 09:47:14 -0800 (PST)
X-Received: by 2002:a17:902:f603:b0:2ed:4456:fb2a with SMTP id
 d9443c01a7336-2ee0dedd363mr31378845ad.36.1794592033770; Fri, 13 Nov 2026
 09:47:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261101082307.151957-1-gahing@gahingwoo.com> <6777074.j6PcuT4dK6@diego>
 <CAPx+jO_gRtipR7iuh0D7G2Wi25GZoqFD1JHVbJNmhd1UyC3Bmg@mail.gmail.com> <20261112072146.41218-1-gahing@gahingwoo.com>
In-Reply-To: <20261112072146.41218-1-gahing@gahingwoo.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:47:02 +0100
X-Gm-Features: AclHuK_xZYTfne11hVPWnloCpcRGvh8w3tWYpN49I_tY52oUY-lip7RnFHUhpQI
Message-ID: <CAPx+jO-KKvgRS0br-3QGh6Jt4efWJ+A6YoRZKFV_bcfB+8sm6w@mail.gmail.com>
Subject: Re: [PATCH v15 00/15] accel/rocket: RK3576 NPU (RKNN) enablement
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: heiko@sntech.de, finley.xiao@rock-chips.com, shawn.lin@rock-chips.com,
        tomeu@tomeuvizoso.net, robh@kernel.org, krzk+dt@kernel.org,
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX0537tUJjaQTs
 rsdXUly99+9qv4CKZJlHffVaPnMTSqaMPEfLTGZl0/5ys9vsiPypO8x48Ch/2yp2MIM7KoJdAmc
 bApQlSmcv7J7OivytTmTsPUVF3TpVho=
X-Proofpoint-GUID: lQxjl2oqcFfVrQMGF_yH3iqtKJsaWn8h
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af74d23 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=s8YR1HE3AAAA:8 a=9GNsruGHAAAA:8
 a=KA_qeCUQCZmkxMg8J8kA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=jGH_LyMDp9YhSvY-UuyI:22 a=gf-oSkQAjqHFJRp-GQfY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfXxwkspBEUtQEh
 hhPj3oplsMcmVSY45tcxhkUrzp1tGN6sb9yrjFVVAHsu6fUXlYPc3/sdKb06f/P1ZRRdbwUq8z5
 OCvovvQBM9D1Fqvy8S0LSl+4gJhF/qk08OV7zeRwJHGPy8rwdbs4JTnTpAYFUKzLXU6qyUC0nWG
 1R0Sse2gzk2TXrN5ZM/vkmsyV3r6C+UWpJbbvmBjdO2z5xenMgbqHxBdn7bgJB0tqwensNlIczI
 ow78vIEet5hSwIKmM+/vZbSgrmQHHDM5Izn8K9NyAwcPtLGVNxshUfetiwWgueo+2vVjAQheguQ
 uQ1v4h/XysXwCjOZrfyaPkB/EX1PrMKHQfc4Ualu3lEUZz3hsWFOf2NMIrpuB76o2k9ainwunOr
 M9HP1C/VO9kZrh4dVkTkIsWie1JbVZzT578mTvh1HgrU0c2I853UZYITEFbyGUtL6KmH6hsDXb/
 GYvVbz1E70JSWwN24vw==
X-Proofpoint-ORIG-GUID: lQxjl2oqcFfVrQMGF_yH3iqtKJsaWn8h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_094718_913368_B55EDB3E 
X-CRM114-Status: GOOD (  16.79  )
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

On Thu, Nov 12, 2026 at 8:22=E2=80=AFAM Jiaxing Hu <gahing@gahingwoo.com> w=
rote:
>
> Thanks Ulf!
>
> On second thought, I think it would be best to drop patch 7 (the
> binding) and patch 10 (the reset) from next. Once patch 10 is gone,
> patch 7 is no longer needed either.
>
> Finley Xiao from Rockchip pointed out on v16 that the reset is not
> needed, and testing on the current code confirms it:
> https://lore.kernel.org/all/ca90a994-70cc-410a-902d-5c4c0aacc9b7@rock-chi=
ps.com/
>
> Patch 9 can stay. I will send a separate small patch to fix the delay
> table.
>
> Thanks!
>
> Jiaxing

I have dropped them all, let's start over! I needed to apply a fix for
the rockchip power domain driver anyway, which caused conflict with
these patches.

Please rebase on my next branch and submit a new version.

Kind regards
Uffe


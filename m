Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D82606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G0JKrPxT;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jpbdRQEC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WPDbv8n0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=; b=G0JKrPxT9exPlB
	DCFf5qzUhjYUpOo9YWofeZ94vShsIk1oXeWlz1yR6D1w18hps5eOmpBDWr2tlxldPj7L8b/0+ZNpP
	YMfZbawx9CkIEqs7TdIR1Hxo2zi+5kD2+Yi0bb3USReAP39ZNcIPglWqdj8yvu/Ti37s7PDlIwiB8
	BI+wx4+GaSCtCnUg37jbganNRohYN248qEwLf6bV90ICvYcfxsnZKaZB9zqSOfJO5YYdnD+Z0vweS
	7G2ydnuIxkir9ke54aMC6XrYjx/QuVIb5zM9pg9C0cvrrLFP1WJhFBRnJw4zfAMOL1uJHdFySWtYg
	WDKRacyX9SgRhdCshDzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWErE-0000000AKwr-3YhS;
	Wed, 25 Nov 2026 15:24:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEr9-0000000AKul-1weP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:24:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEM7QF2729785
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 15:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=; b=jpbdRQECJn9dd0rd
	YCzlMvxKh1E2FuxDCRdZgzLYxR58MASQ/lLJbK7mQZPHj1Gv6CsJ0tKvAJ6xMV/M
	gffkkQJSBTkiChotyI1wk1WWAybtK54prCKnQMFZH+eQ8C9VeCjTQScGYlMh0AON
	GmPvD0irgjac0Z0b+QcJN15xfbB9OBHRPmqm+yD2YYvref173bokKukzcTD7iYIr
	nKr2JqhbWduQYUrgWQQgIHZOcB9rEEmQ24/8vdV4MJ/APNNo2e6fRI6+Iz+0oc8I
	MH4oUuVBaeTRylx1QzrZUteb5v4YJcTw2b8S7RnbKVSkU322pPGVZo5XnxMUZQEc
	e0rN5g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuksh1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 15:24:22 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cde9044a96aso2793664a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 07:24:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620261; cv=none;
        d=google.com; s=arc-20260327;
        b=JYwc7lsQqiuR2rEJa7AWx+1MXmGJjvu59mD/STK5CkEaDe86CzyF0fD/Uxhcr77m8i
         Cr5/GsvLjXBpIPSpzJu75w1XgAOB7aMBgusR6yVTpNmoDcjXSscTiqiIATKwsUtzRzn6
         QhUo41LA6a8cEtZjQsaqkzMsmFyWy86YZTgmWgYskm7WYytlU316SToESGB0ykCoYLUZ
         wi/iZGP8IAz7BG5VL7RKR4NTq9s3hVeGHGFZsGux1tAgGPJBmMyGY88JtyQ3PqDti/e1
         J9GBrikFOBZMv700PQQedobt0i6I25li7hsEWC11dC9NhN6Tm6HvzS32ulTbybZWBvrZ
         yu7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=;
        fh=ncQwhmFH2w0IZW/lrFJA9h28oW5UpYcLYzie5eKnpv0=;
        b=rG3C8e2ZJkhp2NXtETAQdDwaR3/hHK3OrYiO65IEfXUc3VbgLT/YhPHESED3681nTa
         3UkTj8t/oqwSywZqGBPfqZwq5yYGNM7h012konxrpxtBpEj6M7J6klFXmFmfWdOAKltA
         gGxFtaaZWwxTBuQtLPZJORDdZZSr4JJZP+xHBiZgtSRfhY7wCZlLzzhtybXZ2Zebk14q
         mYMraIpzmTTHZw5ZDxFcNpIEvz1tY5N8rNqE0887NsO9wcFDnO5T19bEXf1v/Y62cBV+
         ZgOo+51qlIhtIo2h4hfyuNRP58OfQuxJKYkXBCltm7EPrPut1ccQ/xeiBxXTuSjBwZXt
         lhMA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795620261; x=1796225061; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=;
        b=WPDbv8n0t9eWCqyk7HENINRhj5MEzE3GAG6QXa4DRamfujawQVuFYZgr08S2eTegDQ
         UfcdeXyozv0Vlhk6fzD9M/47k/KIrjSX92PSBgtX7d+ZFrjfsughCOJkynuCobGbfx4a
         BsZMTacpOlu4Lbvm28BIZebiYMcvxu6OJJz6mwHEwnFoubAaII+iMTOapAQA7ficzNDi
         xSKEhIYy06iUGEhvcus07KgevUwEU+KxQ7yAOUXWKEoOY5TydlvmD4+PHH8rLvp0ptoR
         tVMNA1EypQx8CtdolGZ76JQmU7hwwcaGwXZaVhexrziUdmHDMBDuXNAn6O2uDX7kFDx5
         i47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620261; x=1796225061;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=;
        b=Gp4l3SPDAPnRS6y0/xPO8+iwFmq5vczT04gXCsDSzt5iToiuoWrpeHiwfWefUM0KgO
         Z1+ePBE6I1ZhIzQ5N7+OSWa2fGTwLCvaLxRJGcDi+mNgfbm4Oap9MEFd35wCjpjlkXvh
         xsfvOnXleD/Mo7bxH+l6ZlNnD1I01D7eT0iMdQppQTZk4gSjRIG/RkpZTe+wQuI/zuuG
         wPhr29bfBUdGE3yzX/jpLKkU/qD8r8bzvxnnIOEG4qjicnChwypSii8M76BeVXgj7CBW
         ZU4J5ST0ZSissbupqOwph8xYKCZ9tp5VVe1yNBW2wzbeuC97WlXCLSSr3MtEip8CYXbS
         Hf8w==
X-Forwarded-Encrypted: i=1; AL+hErGLLHJRTnnI3dFdOFeW9M9nqQ+yeLZB7/jT73R3lJYAnU5tjwXk1C05kr/AxElD+4uEW6DXwYAo7FQ4ye7nnZtS@lists.infradead.org
X-Gm-Message-State: APuU4Z9YK/cj1JOYrySbyNpN22GR+qM8kGSzSjnufRXYvOagrRMI/4Q2
	3mneRcapo/pvt69XlPiSZ4yNAgsBXF7QDly72GzJhHhM0w4VybGZz3zc32IjNIkGMs+qRgvg3Bm
	+tDyjwFr/e2EJYbozOhI4PsAZcvv14fvMHU+8IP+pn8E2LsleHeVaXxesgQdJK7kgBWDuYN18Tw
	RW/3j2dQiSalon7gjl/K153+Z4vuSgoB+bZAAPxdFM1C/qRjJe9ZyW
X-Gm-Gg: AZFdTZdkuQve71o67KzSDLiGVY+1eAyVplZIdWGtu1iaSX5nxCfsCB/PBpofyy1ggch
	s9fiX20h1cXPXgsocMjo5/6XPU7gbmsUcLO+dNeGrS3EqMIXg+YjhzBezcumW8Di33BkFOoYikD
	FAFKwKJWwlMllr26xyISa119cEMfk8f5bM+NKOSXkfqjxtm7HEn4OoO4T1AA==
X-Received: by 2002:a05:6a20:ef1a:b0:3fa:d354:9708 with SMTP id adf61e73a8af0-4014d35e690mr16693124637.47.1795620260996;
        Wed, 25 Nov 2026 07:24:20 -0800 (PST)
X-Received: by 2002:a05:6a20:ef1a:b0:3fa:d354:9708 with SMTP id
 adf61e73a8af0-4014d35e690mr16693057637.47.1795620260386; Wed, 25 Nov 2026
 07:24:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <37ddba45a281d2957effe5773c59022835b6144c.1795029012.git.geert+renesas@glider.be>
In-Reply-To: <37ddba45a281d2957effe5773c59022835b6144c.1795029012.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:24:09 +0100
X-Gm-Features: Aa3M54rJMX4qh8HyzUvWFdsjdwQqxq_0OhXrr7tr5X8J3Des22u394yZEZEfoS8
Message-ID: <CAPx+jO9Ao4mR5wq_GTQOegLyYfgf6xpq+zz1tTwU_U7BULeb7A@mail.gmail.com>
Subject: Re: [PATCH v5 08/15] pmdomain: Make genpd_get_from_provider() always
 return on first match
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Paul Elder <paul.elder+renesas@ideasonboard.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b06fda6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8
 a=iT_-64JVffYfEt0vB_EA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: rz_NmFwNClexEKTJD1te5OiBe6C1fZFb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX6BjjvHnnuRHy
 fMa3wPWA+OKkWScE7uoK14+8QZDmSQtADzUYtMASUp/kJWiJT5YcFVrWhUbpb+lJZFRxPeR75JK
 md9l95zGkni/1f9866mRxw9yynoFhtI=
X-Proofpoint-GUID: rz_NmFwNClexEKTJD1te5OiBe6C1fZFb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfXwPQxS3SW6ZeQ
 dNP9rk9drQJaQ+Cw262Wutwwq07SyYblu6jSBVG9c2jvlqX9IRHVD4uHJq2zyw4vz+Nb8hQzK9k
 D//+g2II8PFncyz1TLHQX/A++q7DB7gYlKFHpc4Czok19B2MEJ0LGMYyTSOEBxoDtaHroVyQZ0u
 a9K+zOdY1vFJNqQhnBBc6sNp96tHe+KLAARLovCzhv7eCNLDjP32xpDA7jvTJP4yCGM6GoPGyqk
 1Mjqe3PHcHdRSa8MwfPF4JMduTpTSUxnD+kB+yVUkCma9wVBr3sjDjkt9DLVTSPdpXlWLOHg8m5
 5WBg1XGLuUnkQIMeEon3IN0+hB8AxLp6zo90PH1RrGe4aFZdy2ORrVor28zyPP7bu3+uvQUYkgG
 hPdI71ECu7sbKnNnDnwa2QefBPk6bt0wPOWJJ7jpmoIx37wuEWxkdb7wBnPOF3M/aj+A3T0yFdd
 AadfBnQacM3GttvPk0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_072423_621758_01094DD2 
X-CRM114-Status: GOOD (  24.16  )
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

On Wed, Nov 18, 2026 at 8:46=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The for-loop in genpd_get_from_provider() seems to imply that one can
> have multiple providers for the same node: in case a provider's callback
> fails to map a specifier to a PM domain, the loop continues looking for
> another matching provider.
>
> While technically one can register multiple providers for the same
> device node, one can never safely remove one of them:
> of_genpd_del_provider() just considers the device node, and removes the
> first matching provider.
>
> Use the same logic in genpd_get_from_provider() to avoid confusion.
>
> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Link: https://lore.kernel.org/20261019160545.GC3705@killaraus.ideasonboar=
d.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v5:
>   - New.
> ---
>  drivers/pmdomain/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 964e44c2f78f1d55..ee8075e90852e738 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3031,10 +3031,10 @@ static struct generic_pm_domain *genpd_get_from_p=
rovider(
>
>         /* Check if we have such a provider in our array */
>         list_for_each_entry(provider, &of_genpd_providers, link) {
> -               if (provider->node =3D=3D genpdspec->np)
> +               if (provider->node =3D=3D genpdspec->np) {
>                         genpd =3D provider->xlate(genpdspec, provider->da=
ta);
> -               if (!IS_ERR(genpd))
>                         break;
> +               }
>         }
>
>         mutex_unlock(&of_genpd_mutex);
> --
> 2.43.0
>


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9ABE606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 11:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bRix3Vwc;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f1ksWaxW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CtUXg+Kl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jJtLwXE4YbMiscRwIQ+gtJkXK50TzVBvgMUWwQOLd0k=; b=bRix3VwcGbOmJ1
	0RMFIjzGueZFZ0Y83gsvSSqlLJuaNnXK6N9IwPR3WNiwDo4sj7gcht2facW31eH6GdY50AkQofJWm
	1OlwqeRVSRWfyJDNMUCwJzUatXxJUEbLdK20aTHS9Z2R5PkRHs8uVDon/ttlrrg+YYUen8oaAtlyk
	fkECEM0P7fGrOm/UEvhEZCyEqNhEsHrHgR1eWBRPQICaBjy3dJX/OKk5UR5Z47XZjOdi7wxZNmgt0
	hfJgp5g0W2iXHoivh1rbUCldj1Ni0GLe40k62rSksmIhM38ipGJ51L84chMv5Bnp+nE3sEDl3b6G8
	1eA+Oki/8NojWfN19HGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjVS-00000003X29-15yY;
	Tue, 10 Nov 2026 10:55:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjVG-00000003Wvu-0low
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:55:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8ZYDF1916743
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 10:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jJtLwXE4YbMiscRwIQ+gtJkXK50TzVBvgMUWwQOLd0k=; b=f1ksWaxWVw8Rz8ld
	MqqA6xAmL1eaI6KdF6ngVxTNfe1rtXeAfa8cXSgx6t1OROxJRizyCT5xXOijzAo+
	t1vFUcTmIUNcDluxD58KWpiMHoHx/ae6W5Ifo1i1L0DXFil5/mwaBy2xBvMQcbh8
	ds+/A7dr60U4fxFL8T+0SgPIj7G2qGMqT8DYQiYO7VvVN/7apninibA6e0dBArk5
	pjbgEMufR8WBkr9hfxmbnqxaYq08dZKJ4bA+PsAQFBomORtfEyNf68lKGIByyrHl
	yNmv2RqOp/XTP9UBHJTFcwse3MP/WEC1d3ThUO6vipuukBkY8buc3KA20SJySRwA
	27wEXQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw48ft7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 10:55:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b852fdd55aso2454129b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 02:55:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794308101; cv=none;
        d=google.com; s=arc-20260327;
        b=iRamowhFIWCJfaLhz5cPO3xBi8XoK1LpPgYcPB669PCtRCGmSelqbt0jjHop4Oo3RU
         RE++Sqr2mxWiMkwcocACTN1fFlwG6PO3va1sxXQEAoO06bzunOyKD3+jGqCGtV6sxMrK
         fKKt/N5hKqHPxdoQVvxnbammzjJYmqkHkKtsyKsuqnKbU7ilywX6WgDsI86dGDi4Qb37
         hP4VB/ufOguAgljsp/p3FNIWIJeLb1oVBuApRGulm+KZU5+/qGu7f4wYs5jZz/c1M7Bi
         WmWjovlhvDNQApROkQGLpCDGwV1mRR6M0Cnhl0g57qXg3UtwDZQW+KILBcmwK+34uafs
         F60g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jJtLwXE4YbMiscRwIQ+gtJkXK50TzVBvgMUWwQOLd0k=;
        fh=hD4DAUpOrvkGPAH56RLsZAh76Z8g04DNXFMDIp3EJG8=;
        b=kcUmTDwCWdxieVcZK/7uf8fCUVZsy5Z9GJGzuYYPz44NohB42xmSUfnAai/UHomQXS
         wLyeNIaEl/3D6R3okbDIPV5DNpe7XiV85VMtAPob+q/h9dbPW0yHr5XbH42UCLrqwNwd
         /kkl6sLYj+IQ/q7rQlz5aw7x80hp+vUKA278p38Ce11EeVCdfZYhChqsnx53Z/+UDPg+
         juLd3psqkMzEjrlDFFucPwIJCESFxlpaxipROGEq1bEQY2vPC/y1xC/TtHDQ0rT9O0tt
         DjmoEyIKbEVk1a51DLaczGBFt3SZTB/5G8r53KyUL35ifK5t9Fn/ytyP9azt9Ess5nVR
         y3bQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794308101; x=1794912901; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jJtLwXE4YbMiscRwIQ+gtJkXK50TzVBvgMUWwQOLd0k=;
        b=CtUXg+Kl8RHeiyoEnNtpCl4YE53jBwYR6iJAhD52XgxHF2hxWEVs/WD6CszpbLTb7E
         zn03oXc2Pa7jpbh6ev8mrku5S04VVjc1Wsq++XgegE5ASiFVJgM5MgxCQ3oXAptf0wcu
         bjd/cdFsuwfwXxTJ51xxlD559o3LNhoX3Caae1EYogLeiMCZuyJLeFHPNCODNZrsWZ07
         wdWS1wMvSLNV9e2RqKlj4kVpG6PvrR7d7paba+YBqo2gDhkfR99E4PaZg90lKOyChzVS
         HN+bWOUTaH6ucSmE8jCduGqoryWTyv2QGJXgxuBgxnS2Nquyxc0/tVjwMeQotCQ6+0+7
         2xFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308101; x=1794912901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJtLwXE4YbMiscRwIQ+gtJkXK50TzVBvgMUWwQOLd0k=;
        b=vQPla9web1nI+nDi2ZHHXlXrhna/ZLOJfc+okA+9n9pj6aSq70Rxsf81SS211OqFCS
         ENsxYfbcnGzEU+JXLuq4BVBUOQV/j9jK8m6mv0k5FFE5sulcxVZipccsSnhO8EVothXe
         Zu4PQssqeYEUEiSrE1d3+c4nj7v3I2QVjk5uS1nHjsjjgJN7Ig761ipgHArsAOPhph9u
         WR0aEVuVViGXjf2c99gleVExPo6QsryumWivteVBRixRoXRvQRD7uWl+8pvvUZC0ZA6f
         x+6ilXTAdVTf8AnizLFEKcSNrh0pcVbrsqIVioUNL19CET0FGlAeIc01R+I7fvJsTqFL
         1EFw==
X-Forwarded-Encrypted: i=1; AL+hErFh5OxdkN1zZxTkHipHZYMib85SHQC8enezjFu0h8Z2ihYqTqX/Tm0cA68EwC1Hb7z5ukKa/mPr1uQLVU5Ko0Wj@lists.infradead.org
X-Gm-Message-State: APuU4Z+JYyYQA/z+ddjL51Ai3cFkEDuB9vC0/IRbxU61S9Tv2GSg9ZQP
	3bixF6wEmKGxAx/wSRG8/r4zSo/FEy7J17/2+l68aOvXwja9iqv/qZ5gUsuscM+WRJamgIKDL+i
	Q1gyIyJDcFt9iVihFb87HyL1NFYPZEs+4bLx6L/eKMNbZFO9Vr6vjys3Yq+pyB1Q6SEqppI6vkQ
	mJV3KQiwsv8vhfcGrNDXRx/G9hdZtE2QyM9uyXQz1HFMet+GI8u4jq
X-Gm-Gg: AYBFou0Hedcrp5MzpKsZvlhFMg4TFr2BT4rmIFJHyMF9yMC38rl0U0lLdxVSv9cIeC/
	RxhO3vb29ov8/YJhb+U2E9dx+OJ3M1D8KDEMvSjiXarZrwvbS+MTm1Wb0rtDUqgFakQBylX3ebG
	KmI2bGgT5yMd3EBqu6fLlVVlq71+mWdwrDiplp+2IbMt9AKTWiXs1OdxmT9g==
X-Received: by 2002:a05:6a00:13a1:b0:8a0:1435:fda0 with SMTP id d2e1a72fcca58-8ba8aeaabd9mr2606968b3a.51.1794308101078;
        Tue, 10 Nov 2026 02:55:01 -0800 (PST)
X-Received: by 2002:a05:6a00:13a1:b0:8a0:1435:fda0 with SMTP id
 d2e1a72fcca58-8ba8aeaabd9mr2606940b3a.51.1794308100616; Tue, 10 Nov 2026
 02:55:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260924142520.1594149-1-lgs201920130244@gmail.com>
In-Reply-To: <20260924142520.1594149-1-lgs201920130244@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:54:49 +0100
X-Gm-Features: AclHuK8rWqeadVtw_i39_uuIhclFTsB4ghO-HIhVp563_1PxcLFRfqznhN0nh6k
Message-ID: <CAPx+jO_EVCeOtSKSekve_w11a=nnpyq2qWAa-R__T-URjNXwbg@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: imx: gpc: remove all initialized power domains
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miaoqian Lin <linmq006@gmail.com>, Wentao Liang <vulab@iscas.ac.cn>,
        Shawn Guo <shawnguo@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfX03nLlF1MdQF1
 O1eOrwlK313R3c4TqfHC0j5hPTjhJfWH8hmUx8iv0PcpjzFpQo15VT2qwIetgZ4mIw8pkDnNrFR
 7AviIK78rdFin9Np9/F6zzzzxgOKHDSw0Z1+1bbIcukyOvCLJFX0Zz0H/awExRvAthwRoV1ZjSt
 958/x2glpVaAToZ1oq9JusDUnAy8XhmKw0H2ip5UoEzQLqIq0dYzONLvV6axr+jlaF0Mw1V6o4G
 QpbaKbgFRmr0a3XU/UazNWjAo5Eyvpy8XRECWOdGBizKWlNjMdVD8b0iCaIB0Gkax58mqe4Nk0t
 p6zlKXqUXnTGCDV/DaDAT1/K5gHGwxO/oqjaAQRO84mzVr7Q0mHsBvV2QeblkILqjc0JcYRrijq
 Vekkn3bkcWnVjN6KH83mCJe57nnO9qLN8CCiNY24pp0DALAcTSP+uVRjewth5n06pJNMCOgBj58
 brSqGSGCYa8b9frj0sw==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af2f805 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=Dljt1d-j0Gip_uCM0CgA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfXwp1lpne7vkg6
 rjyZ4mqcjSjXyrNRyreGPMaI5I3dPCaiNFwl2FjZxaHMZTFRhblZD20NFc/F5K7pcfhc6raoCq1
 XvEtbzHF+y2aR1nJ/9KZwXsMRRz1VKM=
X-Proofpoint-GUID: urfa1jEz-RbXMDDH3T_VDJmLc5gMU5AX
X-Proofpoint-ORIG-GUID: urfa1jEz-RbXMDDH3T_VDJmLc5gMU5AX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_025502_239739_2A980DA8 
X-CRM114-Status: GOOD (  25.32  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Sep 24, 2026 at 4:25=E2=80=AFPM Guangshuo Li <lgs201920130244@gmail=
.com> wrote:
>
> imx_gpc_old_dt_init() initializes all power domains described by
> of_id_data->num_domains, while imx_gpc_remove() only removes the PU and
> ARM domains.
>
> Use the match data to remove all initialized power domains in reverse
> order. Release the PU clocks after the PU domain is removed.
>
> This issue was found by manual code inspection.
>
> Fixes: 5a42d1198901 ("soc: imx: gpc: fix imx6sl gpc power domain regressi=
on")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> v2:
>   - Check the result of device_get_match_data() before using it.
>   - Use an unsigned num_domains variable and a decrementing while loop,
>     as suggested by Andy Shevchenko.
>
>  drivers/pmdomain/imx/gpc.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index abca5f449a22..d83fb37e2297 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -502,7 +502,9 @@ static int imx_gpc_probe(struct platform_device *pdev=
)
>
>  static void imx_gpc_remove(struct platform_device *pdev)
>  {
> +       const struct imx_gpc_dt_data *of_id_data;
>         struct device_node *pgc_node;
> +       unsigned int num_domains;
>         int ret;
>
>         pgc_node =3D of_get_child_by_name(pdev->dev.of_node, "pgc");
> @@ -519,20 +521,23 @@ static void imx_gpc_remove(struct platform_device *=
pdev)
>         if (!pgc_node) {
>                 of_genpd_del_provider(pdev->dev.of_node);
>
> -               ret =3D pm_genpd_remove(&imx_gpc_domains[GPC_PGC_DOMAIN_P=
U].base);
> -               if (ret) {
> -                       dev_err(&pdev->dev, "Failed to remove PU power do=
main (%pe)\n",
> -                               ERR_PTR(ret));
> +               of_id_data =3D device_get_match_data(&pdev->dev);
> +               if (!of_id_data)
>                         return;
> -               }
> -               imx_pgc_put_clocks(&imx_gpc_domains[GPC_PGC_DOMAIN_PU]);
>
> -               ret =3D pm_genpd_remove(&imx_gpc_domains[GPC_PGC_DOMAIN_A=
RM].base);
> -               if (ret) {
> -                       dev_err(&pdev->dev, "Failed to remove ARM power d=
omain (%pe)\n",
> -                               ERR_PTR(ret));
> -                       return;
> -               }
> +               num_domains =3D of_id_data->num_domains;
> +               while (num_domains--) {
> +                       ret =3D pm_genpd_remove(&imx_gpc_domains[num_doma=
ins].base);
> +                       if (ret) {
> +                               dev_err(&pdev->dev,
> +                                       "Failed to remove %s power domain=
 (%pe)\n",
> +                                       imx_gpc_domains[num_domains].base=
.name,
> +                                       ERR_PTR(ret));
> +                               return;
> +                       }
> +
> +               if (num_domains =3D=3D GPC_PGC_DOMAIN_PU)
> +                       imx_pgc_put_clocks(&imx_gpc_domains[num_domains])=
;
>         }
>
>         of_node_put(pgc_node);
> --
> 2.43.0
>


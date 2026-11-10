Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D1560A2638
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aZlkNwpT;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SIq2FKal;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TQueM0DC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0zn2h/mfdeJyzmrvYGtYi3WlYP6oFtDlczeBFhJTZ50=; b=aZlkNwpT2WYnrN
	n4izPbz5qpmx4XMplB0tM8u5z6z5jw1o6QYNvQIzsdAqExnzE7voY/tTkD0630DxkD6Eojnidt6NC
	x9hRWRSAh/87vJ+6T2I5OtR4s7YuLpX0RTdWKPETCMGKQr3kWxLNgsxSvzTm32eDCNDp6TuILpVtY
	945PSv6u4ta6/wmDmVHdSYnrbLw9CyFeOkPjt8p72pffhXfFSdBreZFkhv1eACoyNWJXZGlgIPLx3
	G+0UM6vIaJHk4aXe9J0YxZzV+p1hUzvBd1OyaP9JeMta6T9L8U/XLtXWzhYjFpCrZ5EKjBU2rSZxJ
	Q2k1hgNVBPTCIfnKIUxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjVS-00000003X39-3A8b;
	Tue, 10 Nov 2026 10:55:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjVL-00000003Wyu-39X9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:55:09 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lDXD2240785
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 10:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0zn2h/mfdeJyzmrvYGtYi3WlYP6oFtDlczeBFhJTZ50=; b=SIq2FKalNnAEkO2P
	oIkOZMlWpOUnJ9sGWRZrSd9VTJoz1ggGjeIgAcwU7l+QMtNkT0zVc6JPRXaYU99N
	LzFJZwYiQjttoE7IbpNIV+HBteYxQr5flBOYSR9G4gADntAZfgCxaW8Crp1DuiLa
	c47wDPuFdtAOCJu4ueco1U6A7wGwrhQMNbq0ZMQHHTq7FlquqlorT6j4DzV3Posc
	qe/bHHKmGwQ1P+zR8Ot6kd24HmnhH00i5gbJkRv3alyFe4cwKk2azhHErstl/geT
	KmZTB7ADiQlKqGB5wim9lEcjL/UGXrg9AMpkaWgK+mv29UUB75zXBJSSdcGiIbwS
	YhZliQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp1mq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 10:55:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed08b07232so17203215ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 02:55:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794308106; cv=none;
        d=google.com; s=arc-20260327;
        b=XOsDjfX48AY305L+DfuU4F7J4jYyLftwmV/qRi0lC/5WeQ5/SJcjlkPREQuNkSWdb8
         1hV2pBNDxoWKcjMm9kM8IZMJxURg0IbMKejFsCzt7GzJQ9zuvoSHCp49bUNTUJ1cTMKV
         RIzGXnjAdRWYAPWnNoM/DGbX+26WCc8OXdow2uxzLmU6nX6ZBTb1O3CvVd4QBvLf8L43
         i3jwdz/JRAY1IwOv9roupFy3UOZ+qyHvuYVU7Oj6WwyGvhvtXYYV3/Sl1bfl0XH37Xfp
         VMH9fmzqQpE9etmo1J3etyqLCBHKtW1QbGKkewVjpRLHAizEzaWqTPgos2aVvhmATNNy
         8hFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0zn2h/mfdeJyzmrvYGtYi3WlYP6oFtDlczeBFhJTZ50=;
        fh=rcXGmMDRgBGeJd6UyId0wTSOn2OE+jiVBrpo1Yvt/R4=;
        b=kI1zg2954aMPUv99QK87zpq6MLQ/4SC3eJXQpBvX93lPudYr7bSgrNNEvwv7VE1vFT
         QMXpcpLbgTGX5H4RjdU33bevye1J7pI8whG+9MrQna5HJab7uATcrfttWr+7somwsWuY
         b4XRJq42HSFAPGrYYPwMylM05P4D+GF+1CD+ftzsFBB9Iyiu/BV9IEB073JFH5pk5M3l
         ipV6YV9Q6Ty6LbN8EaKFQpzaE/o77qb8cJzmaClvDb6o1XF8XTuWoHIBMHrM2qwzrQki
         RK0NEBIYcDLUffz61FtctCMIqGoLywDV5dGwjRRM5lBuKFYcuBE2X1/ZBNv4A5z6YORp
         tx2A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794308106; x=1794912906; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0zn2h/mfdeJyzmrvYGtYi3WlYP6oFtDlczeBFhJTZ50=;
        b=TQueM0DCgC2Y9X4pnmpeY2sAMcDdlcruT8qBxbPIOokjVo0Ui7Tg2VoB/+wDggaD95
         UdnsOzTUSceZoR4pE1pX1//e5/nc2LmPze5+syV55Q3yZfm7X9ccKcmfAdpBXNJteZ0z
         Jw8TbUHjTv0uJCdDbyYQ5YO0u/dGlRnRvJ+Y/g9cSwHUNdvtOuJFrkN7uTgjjtdhK/ee
         CbMfUI19NExFae0p8r2x43imEgQZTak9pN1MP1+i8nL/DmMPHoz8Da4hgI/Hx3C5XRD0
         rROeqkiC+Arm3j67wQ3DJKX/tPgtC9s84dOfACo7gQwlr8Tj2MXr5ulNtNC4C/s44a7v
         FG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308106; x=1794912906;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zn2h/mfdeJyzmrvYGtYi3WlYP6oFtDlczeBFhJTZ50=;
        b=hxIb1WGb5/a0tn2okrecZU1/Cfoy3Yie6v5VSXgPzXNgPr0Cbs/QADqY8TXoUAHMMP
         GcIV82xTA+SYaRqhrECHTIJkFVHGPWRMCsVUylxFXOq6LsscPABeNAMBBPVWtlsO3KvR
         2eqQ+91AZcaihewaWkmAQF0w+JvNgCwfOfJAw/qhT4Gn+em/IbOofKqE7go4uL6g7U1C
         SkN9W87u+0KRzmxdIumw/ftkVCMkEwnMIVTaSx3J7iRuV2BJbbHAblKBmIhqL1cwFwOh
         CddFKQlgjILLeubbJAUvCfkSNrceOxKusBj+dQ/F/yL/djaOY2iOQnW/ithHG40TUokr
         OIag==
X-Forwarded-Encrypted: i=1; AL+hErE40GBiz2mgKff49OCv47OcYbHhqGu2V2rQmmoA2MUHKBpEbyzwAvDRs7AwmkikjDvjs92+sH2VHkeFJyg1dXyu@lists.infradead.org
X-Gm-Message-State: APuU4Z8luf5MBxpJFGgN+y1G2tMYm2d3SOxac3YN/cJL96hIHa3b+Cq0
	8myh/mUBCna9STlm/BIFRdH7JK6710pM2qGbO0WiNuKNmbvQuvcwDh3yN0bDREeUXVWbSRwJ+tc
	B9bRvDOVnUJVZsn2l5LLROshWSW9o8JefM774s0bBmaQqmK/f7xyq51WJ2qGp5mbariEnEzd9NZ
	TnVJWLjHb+ri774VA+LwjMpSyyYE5EK8zi4pmdEfM8+Zf6Tz6Aeptj
X-Gm-Gg: AYBFou2px5UP95vsNe3BWoqfOWzigXxuk8M65OZ4fVGo+KzdF7Vcx9MGpbwVDHWCCpX
	J4zdCozymbP3HHMAwk3ixv/nEFA7Za37trl+G0TO8TQ7BZjM55zLqJw7h7s1wnKVvwYUpu2QFjQ
	WwXz4yJOs5/GpNxMjrVh0x25Rul+FrnFXOBemmUIDFKfh6qAzq8etswB3odA==
X-Received: by 2002:a17:903:1a0c:b0:2ed:4ea4:2dba with SMTP id d9443c01a7336-2edb8fb3d86mr20040045ad.5.1794308106403;
        Tue, 10 Nov 2026 02:55:06 -0800 (PST)
X-Received: by 2002:a17:903:1a0c:b0:2ed:4ea4:2dba with SMTP id
 d9443c01a7336-2edb8fb3d86mr20039865ad.5.1794308105831; Tue, 10 Nov 2026
 02:55:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260926-b4-mt7629-scpsys-v1-1-e02d03d2151e@gmail.com>
In-Reply-To: <20260926-b4-mt7629-scpsys-v1-1-e02d03d2151e@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:54:53 +0100
X-Gm-Features: AclHuK-wCHxxV1sk9ELba0eXodmE19efdczWGBPVlSLOk0ffW72xQC95zfSkjvQ
Message-ID: <CAPx+jO8r=bBSZiw3SVfyaU6XRWtPGMj-okMT3=NnTY=Su+fwEg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: scpsys: add MT7629 support
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: GNOghzDRlNddlG8CJ14WzRaTpX6KraCq
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af2f80b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8 a=3fVjQ_tGrbk1vConURoA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfX1ECJweJC+Kwd
 d4M24K7tcfUzS0ouW8zmsLXLD6YBUhppHTmt2PSJjI1/QmcPxSKIf7iv154JGEgGPU2WYXcGtnL
 bdgrjHrUUcXOVLM2hngTZX4i+JRBzdd1QonjawRO0S5nAVGuB5DwGOYr6PXzMVv8xh/GmG7Ul4t
 xINgA8XubU1g3s6JaWCN8jEhsofCoDGl/SOeYTiB+I8rjOxahgfE64qCkTmq2MprNxQv536FEjQ
 AhsS032U/kkl9UvLA/aWyYqkPXsn7PqYcDNacrq1EdvIr55WkQj4lmCCBbwzO57pC7dgM3ipdHh
 2goMsbom/esT8lZyv+3IC4sn3N2WgXF4rWtb+bp8doaxpLu6vXDH6Qsx34bnmIbsamcpuujTLTH
 9hk5/qr5jgqx93G3IaMO36PbxZq2jORX5K+REXUApe4WHURQXkvt6MMsIfvB9s58mkXAJkhNrEI
 9UuutVfRaCJj/J29W9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfXxx6ogprzDouL
 MdNV9cU2b0YF7Xw7/64+Pxi/mJTnWCzjky7fQx9yHJod5rN16zSnpNUWlmc1N8vyolViCQc8Wbz
 r5jfGHG/qJZ2TiRFIhFsuBE7BE7U2WI=
X-Proofpoint-GUID: GNOghzDRlNddlG8CJ14WzRaTpX6KraCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_025507_800141_C068D0A0 
X-CRM114-Status: GOOD (  23.71  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Sep 26, 2026 at 11:59=E2=80=AFAM Chuanhong Guo <gch981213@gmail.com=
> wrote:
>
> MT7629 currently uses the MT7622 domain table through the device tree
> fallback compatible. Attempting to power on the WB domain triggers a
> warning during boot, and powering off AUDSYS times out.
>
> Add an MT7629-specific match entry to register only ETHSYS, HIF0 and
> HIF1, matching the domains exposed by the vendor driver. These occupy
> the first three entries in the MT7622 domain table.
>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-scpsys.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-scpsys.c b/drivers/pmdomain/me=
diatek/mtk-scpsys.c
> index efc8f276ffce..2b5bd8d61cb5 100644
> --- a/drivers/pmdomain/mediatek/mtk-scpsys.c
> +++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
> @@ -1073,6 +1073,17 @@ static const struct scp_soc_data mt7623a_data =3D =
{
>         .bus_prot_reg_update =3D true,
>  };
>
> +static const struct scp_soc_data mt7629_data =3D {
> +       /* Reuse the MT7622 entries from ETHSYS through HIF1. */
> +       .domains =3D scp_domain_data_mt7622,
> +       .num_domains =3D MT7622_POWER_DOMAIN_HIF1 + 1,
> +       .regs =3D {
> +               .pwr_sta_offs =3D SPM_PWR_STATUS,
> +               .pwr_sta2nd_offs =3D SPM_PWR_STATUS_2ND,
> +       },
> +       .bus_prot_reg_update =3D true,
> +};
> +
>  static const struct scp_soc_data mt8173_data =3D {
>         .domains =3D scp_domain_data_mt8173,
>         .num_domains =3D ARRAY_SIZE(scp_domain_data_mt8173),
> @@ -1105,6 +1116,9 @@ static const struct of_device_id of_scpsys_match_tb=
l[] =3D {
>         }, {
>                 .compatible =3D "mediatek,mt7623a-scpsys",
>                 .data =3D &mt7623a_data,
> +       }, {
> +               .compatible =3D "mediatek,mt7629-scpsys",
> +               .data =3D &mt7629_data,
>         }, {
>                 .compatible =3D "mediatek,mt8173-scpsys",
>                 .data =3D &mt8173_data,
>
> ---
> base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
> change-id: 20260926-b4-mt7629-scpsys-88d0cf37c6e2
>
> Best regards,
> --
> Chuanhong Guo <gch981213@gmail.com>
>


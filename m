Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348E1606CECF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 17:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3gqXj3C1;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O5Y2iAae;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YLzBqMNo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=03h8Stqm2jiHP1ePJ8/GT4xjXmJ9AokgbaM3KsJdgkY=; b=3gqXj3C1KecpWm
	pqkaZ3+hcTHBCuIVMseVZgSzIvAZU3ptqvq9x+oQxCu1wkvAE7KodnYz3yLtGOB5bEVHcXqO3RvAH
	Y3dc35fP0jonLNk8WKeRWbAohEAN8I1MxQwgwEpGz9uBCc7IUq0Qda/lfWmu5e1QjRArhOZLRRjuJ
	rXPKQu+pUaoltoT1djDj43PKVde7V7etXY+ReY3qhztXuk2SKviOnjLtWTwfcz5iCO8pCnbFD8uIP
	M6gEgI6sVKa+HdBGaJyjH+mSRyoN/cs0Q9y7/eWm2l2gPpYZL8vnfDiGJrpAj85Q8kMWwQPu9kloc
	9hc9WYoBWr9/yS0aEkvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvNW-0000000DmlF-1N2d;
	Fri, 13 Nov 2026 17:47:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvNP-0000000DmiC-3eBv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 17:47:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR6JG1189968
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 17:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	03h8Stqm2jiHP1ePJ8/GT4xjXmJ9AokgbaM3KsJdgkY=; b=O5Y2iAae3vxsFE5d
	bb/rkn64PBwYsEBMSAwKJaK6QUBOzvaT/JN7Sw+WKNElb9GGov+5+qBGIPt9dyjI
	UOCX/5yCyKcW57d4cg6vRl3v16ZA/YI1s+lltrHyx/sP7shs3NV680IKYwiZwKC8
	wKhWXV6W2DUQI4X61efRhfgyLDseWAywprIqlnavRxUKN8d86RxDtCnyzHgDpEYi
	J/0TzccypLE2Bd4fWDQ0AVjoaNovbbww1x1Gltu2UrkdksM/l+KLy9noKBA4e5Uv
	XfGLWfvUT9lt2CtF51P+LQ7LTBgxktLEPpwWiOSETJNQfotta1ir+bN4jfUT8Nzt
	FzxYSA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufkftb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 17:47:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b8cef34b43so1832938b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 09:47:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592071; cv=none;
        d=google.com; s=arc-20260327;
        b=P2bfWrvezhOvEmaF9/PHPA3thI5XN+EIEBKB4gBCaFZXoVbTwlOOChLVqd6GTNhURB
         N1SFOa7m+YeJRRoec2g6CvO4iloV/KQErvtp2stKb/LJPagmuXc69zpNJsXxO+jK+BhD
         zgQAu4sthrzp+sOqvfhcuhGmHLggvAmbGngNW8SBr5F/WPqJD6arUeozrba1n38kW0lN
         Lzw5j1rCR5hlK4omJZED42U9+5TcHke3O/o2ehnFSuz1ZMgr1nTYdjnv5d6WGkOxR1B1
         CX+JQDfM9p7RUGEWV38YffPLQi2POiAGdiwm/lGocYLPq+NWdo48YvSMyQ9uXy9GCi87
         ZbdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=03h8Stqm2jiHP1ePJ8/GT4xjXmJ9AokgbaM3KsJdgkY=;
        fh=eOUK/Rb6Mz/P4DwcqiFX5VyFcl27bJQlvJ5VfCz9+JY=;
        b=ETDQvkvpDqe0bB54+RRHWmxicLJ+X75m6R1WFSUDVx0iUwUxiO6sFder0/d1lWXj5K
         pYDetLI4FuLpIWRY8T+EoLd6iJ1Pu/kgZPEEnLQUmFC7jJSvHc5nom5l/GQBhdsgxc6A
         fa5xJLFXt7h3r3DFy7PDMnzXf77xDY/NUmbOYxU9czKpm0u7aJbPw7fokyFXSaEZcTmd
         7fWwK1CGEbimZGTDL3OEM7UVacQbE/rsl7D6CqHS67UB3daJtKMA0Jn56X1oW/qwnnGd
         s6GNQbCe9fpZqGTv0rJSCs57PwQ0TWhcTIznD8SWl0jgmELKnZN2Vf0SzpDn1/4desyY
         eq1A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592071; x=1795196871; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=03h8Stqm2jiHP1ePJ8/GT4xjXmJ9AokgbaM3KsJdgkY=;
        b=YLzBqMNo7SWGl64WNtmNTiPOQ4sS+lAux4G/TfPs6xZoqE/rXTG59JQ130j4yeHcGN
         zv4zk7relfU+uSWk0/iQf5n8R0QqhQWDJUvxdywQzBng6t5pZQab6G7eZh4Jwwy2esZr
         expwLrN122Bpmo26enPimNmAjJoVcgReaMy8NRvhXp1d2/ZO3DitJ2uAtbpURYx2db0n
         SwaEcynlsMtm+BfvkZdtgI4Dm8hHK7kVvBmg1j64FYdCEp74abkdijnVyISLajbwoITM
         R3gTYivqIqjqcLuLT/2qPGHODJBB1uXCixmUeMhrapassRzU0mZpQkJGH0X/YqQGyEzA
         0EBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592071; x=1795196871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03h8Stqm2jiHP1ePJ8/GT4xjXmJ9AokgbaM3KsJdgkY=;
        b=LCbE7orE1qXZNabJkIWPayltN6U/b5NcpsHmvcO18enIF5dbfsqJJLOXg4GQvxEREu
         Hc5dFMVvUyegb4X4kTNMDZRBgqaF5jQztMUwN0+n9zvHTaXvaaaIbtGTLtodEKGKGKlv
         bCxNRaoVWbodvJT7AsjUcr7Me2GYr4afC8qF52rbSpa5cSMFRAUt3/h3XlZvn8H4hdmO
         9bVW661cCVD3+3FQ+520lYbF5KohCQ9WnDlda81aDPciBlpR99NPzheRxuVkloc3zlAa
         rcM+A+ah2QoziHcgvvbs6ZMznIGa0b6C4QuZI1QAfNjkzQWJ7CqSjjgRg1A9X1G2sSXF
         bTgw==
X-Forwarded-Encrypted: i=1; AL+hErGSk8kOaukxbXW9qSa5Vz9b4nUEtQQbyH18lI6+kAadSGERa///O8vVfqprbLobdZLcX/7VZiuEKczo+hABrwlV@lists.infradead.org
X-Gm-Message-State: APuU4Z/pnpl1SMfP9WXbmf8R0xPVhy+5cvW+TXSRXa5XEZvZwjJsSGlP
	tfW6DYvYOIC4oXoT4Pzny2mnxCuAYResvqSBpGmeeqXlwkh+EmAU4o8KUlm8OK2j262QE8JWXrQ
	oavJ9pzoP5z7Zk9l0LNkh19ku5t+lWbmDODUSB3CAtyxPeA5YDF4I2TZv1G6lW2h2BDtq0YGnhO
	tvgKWWDPb8ThCXD2rqXayekAeyToPgPvdH3ayB5mum0IScKZdsYKgb
X-Gm-Gg: AYBFou2sroLSjRbK+ud9un/WYpLfUYlXYebi+CWczD7JfbWBCljFziYs9bZ1Dc7HNhZ
	iLIVrcJTE7Pya9GfzqDMr7NY15G0AlnLqRSoEV2TKJ65ZjMZjZr/Lop+6ePHA7qayZ17T2d5CCW
	Wp+BH2YY1Yd2eyGtUMEIxOH9WMtId2aIqktUc06nNLBUyyKvdHWTICblCZqA==
X-Received: by 2002:a05:6300:67c7:b0:3ed:b2b6:9bdc with SMTP id adf61e73a8af0-3f7a81b6293mr3316955637.54.1794592070873;
        Fri, 13 Nov 2026 09:47:50 -0800 (PST)
X-Received: by 2002:a05:6300:67c7:b0:3ed:b2b6:9bdc with SMTP id
 adf61e73a8af0-3f7a81b6293mr3316931637.54.1794592070412; Fri, 13 Nov 2026
 09:47:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-0-dfd445dc3763@baylibre.com>
In-Reply-To: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-0-dfd445dc3763@baylibre.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:47:39 +0100
X-Gm-Features: AclHuK8NzVs_OvZcfoqmQEpBpt7jEXwt_UF2F5ZEs-xe9awuz15iknhP_y45KKk
Message-ID: <CAPx+jO9wAPreJr5Gt5CVFqb=E-hMjQnwRWwdnvpus0MObio4nQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] pmdomain: mediatek: mt8365: fix defines and add
 missing one
To: Julien Stephan <jstephan@baylibre.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: AhJgjXM6tLqKxIGJ3xwwOF3uCEhmvhU_
X-Proofpoint-ORIG-GUID: AhJgjXM6tLqKxIGJ3xwwOF3uCEhmvhU_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX55yfSWab/H8N
 Scy8GyepoYvCKVNEWA3dOsF+H7iL2vZviGv8e83GZTuxHfrg6e4wOxlU9xKsJ6iSm5e19YUVBc5
 TTQUk8VRLEMYq2nEg6i7VEK+OpdZ7XdvVC3gQ4qCmVPBmEHaNLkeAE6Vm7OnF/ZGpOeGVfDBxG6
 rh5hfzzy0yPst5pB6x8mTkuMleQ8anxLVmQBLYclEooE8offrftP01JlfPo2+Ldc031022tLBBG
 n5Uo84548J1pC/+rcUvOrjkl3qoU6mQUEdt8qccjouK1OTo+Ny5AB9MUPkTd99N6B9V3W67AWpV
 r430oHsDtjAXYJBVhRmwANGjiScyJnCwyztIwSeJDsMYV0ZyY7xscgLYAYNpuNUW0PnB0D/r3YU
 bXEZpGRo8xVvi5Lcwsg6sHuxxK+BTXmt5t81rRPlGi0rapyHYFC8vaa7BV+g4kwrIsfcXrphc+s
 GxB9XzcNoerJ6kJGSNQ==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af74d47 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=IpJZQVW2AAAA:8 a=uk3U7i1IYnWYCnW-BX4A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfXxir3ZzDpTHyb
 pmhYs7c4pxEc4yswuzdlqwLliOmERPSZdmeAarsP1hkR9XHHE8vAm4RrXO1bJcaGK91qoIlfqD4
 C87TMpLY1lABns2hwlRDUgLvjg8aqv4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_094753_865816_AC806F00 
X-CRM114-Status: GOOD (  18.95  )
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

On Mon, Oct 19, 2026 at 2:33=E2=80=AFPM Julien Stephan <jstephan@baylibre.c=
om> wrote:
>
> While trying to add a missing define for BIT(25) in
> MT8365_POWER_DOMAIN_MFG, I realized that the name was already wrongly
> assigned to BIT(22). Trying to fix it, I also checked all other defines
> for MT8365 and noticed a few other mismatches between the defines and the
> datasheet.
> This series fixes the MT8365 defines and adds the missing one. While at
> it, also fix some indentation issues.
>
> Cheers
> Julien
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
> Julien Stephan (2):
>       pmdomain: mediatek: mt8365: fix defines
>       pmdomain: mediatek: mt8365: add missing define
>
>  drivers/pmdomain/mediatek/mt8365-pm-domains.h | 11 ++++++-----
>  include/linux/soc/mediatek/infracfg.h         | 21 +++++++++++----------
>  2 files changed, 17 insertions(+), 15 deletions(-)
> ---
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> change-id: 20261019-pmdomain-mtk-mt8365-fix-defines-c6be65ffca95
>
> Best regards,
> --
> Julien Stephan <jstephan@baylibre.com>
>

Applied for next, thanks!

Kind regards
Uffe


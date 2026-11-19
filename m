Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38519606A333
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 07:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n1hQIjc1;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oODRBWzo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NrDM1GBz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DdDcVD4zeEPNRO+BwyCwbOJ/2pD/TbB/A2AoOr6cETg=; b=n1hQIjc1Q8Zw3p
	2obebT5JwMzyDQl0KxhTIbUNECbRHOQitKQHz/EeWx4BRi2q+C8CoskN+bNnQBVEyjCicBR55HbY/
	9p0/cEyaIZSRmEKx3AatQhmMaIvS0dCSje94LE4GNXDFriXuagNhDBpIz+/WHbV6gD2ZerluiME+y
	2n/73qOJQ8hIuN6jvKvqzeoPRM1Y3iklUaPZqgOKQwZdCQiqoAvKvyijp7QX0o30PUfe+o0ay/pjA
	fcY0Oxw7+KkvIoH3JOUKccC5nSp288m/Ybcv+fCHLzA5/NOI7RygjUfddrk3UIfSb4IfQw727ymc7
	jWKgWjiKmlgTI+ZIsjPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwIu-0000000B2h0-2e4y;
	Thu, 19 Nov 2026 07:11:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwIr-0000000B2ff-0OF5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 07:11:30 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vPI62194725
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 07:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DdDcVD4zeEPNRO+BwyCwbOJ/2pD/TbB/A2AoOr6cETg=; b=oODRBWzo0WVLn/yz
	r/qqs4ew38c5s8Y2C9jWsI/MdgQ3doWeU4tpKM668Y59KVFjh5Ojy6BtYFMQx//Q
	c9O4rATzmpDthO9TmKuVez34+oEA7Nuu6SO3oJegQR8SukJbaO4NM0+ydcUpkxsj
	N7nhUFgdy1EvlApUY33U4k2hIVcTe/nwLO6gcnAIaiUOdcSg0qhmQP3xn/WImpid
	8Wfm6YaIiwoXMAuz4498k8qqJioS/+7JPdSnhH9tiZIhS26sP18VTwlc4xOFTxpq
	djd0eDo+5vMcTIC1oXcR0ck8bKKnPHKnc45xLa4LK10eS/pxzLtp36m8LTcYahTa
	Q8M+1g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1e5qunfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 07:11:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso1414543a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 23:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795072286; x=1795677086; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DdDcVD4zeEPNRO+BwyCwbOJ/2pD/TbB/A2AoOr6cETg=;
        b=NrDM1GBzj0eZzQ99GkZLTfijW2I9W9GXUY+KMRo3dPIsp20r8S31iO//A8OGpNyN7/
         MZWFLV31xF9Z01Hfl+a+VtsZnXizKw6NIEpM5KHtmx8c6NzoF4otoZDe2r5G2QxCqybR
         BpxJUTPF80y6gR7rCvxlc30Bk9+NyK+xVH90hBgUJ3mZ+DTRrjFdROmdILKsdh/ow6Mg
         mULBci0GtEhgTdSvd5SBTt519SHIBF2VIRizEpmAtzfIDtJyMEtMtxF9pih2o1JJ+1tq
         6izoYJROEmclJgEBKSQgKbklTMp5Lx49sO21qDNhGagQ2PWeyDT77GpneQkn+ZvVte+3
         vDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072286; x=1795677086;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DdDcVD4zeEPNRO+BwyCwbOJ/2pD/TbB/A2AoOr6cETg=;
        b=o+EWLdCJCIRCGWcawDijKPmGhBgFSEtbnEmHml4u41ONqey3y7FzObehswuoFzP1G/
         MD7nqmW+7y9a5qxX5orE16KRIme8BU+IjrhpLc/63zUzsZjkoSFzBa32TjNx2FYWTVAa
         6LKkQahzRbpWCTCoMunLT7mF2547d2pYuEuprML6O+VDxd90U9C88O2wG9AUxIeVvDj6
         R9lt3D3zsiR9d1Ts0T3M2ur+MYnEK6aW5PulY3F29TjQeu8cSYVBXElaqcVZasGxKjAX
         K3iCR4sPbMIp2DuWIFLNY+5BCpksQ39alhja/pF1ufhH9YTphhN1KHs5vg1fPvnRsjOB
         8ehg==
X-Forwarded-Encrypted: i=1; AL+hErEJJZAmCuXxX8A5niAa+VixPO4I+MdGtJc7wS9i2hzaKk9VMLDLf74JsEdboFq4x+xV6bg8aKkI6+bVPldlidrk@lists.infradead.org
X-Gm-Message-State: APuU4Z+6uA0jM68KiYr33yRx32OMsOElqKOJaxP/1FULetYYmPM3vP1j
	4kjVrmUhVXGJAYavb97OkOsNa9LfP5lN6le+gJYQkY1OoikDGGXhzhhEHF9oWTPLzsyi7EQyTn4
	4gfnXRg0Vx7LK69C3NVRqkdGEoNWDwn9PJp57UTJrIw9Xi+2DMP/Teh+A6u3m2Gj+csNvR+31Nc
	suOA==
X-Gm-Gg: AZFdTZec2+FLQ5rzDWDMgn7bzXA94vI5/rf8Cuzv0ZQB+LbgmyffX2M/Ientu6hRjgR
	8/MawKUc2jDRYaNSEx0ajkEYBoL7hDANnMBfWTYfSQFCTkuk+/Kq4WSTdDccJluKyAB6DpwLOBp
	YH13N5kzf4rX3oCXkTb0ilZOKOzp3vlO9CLm0AGxnrkPfWG7Rgm/e0qlIBkdo9+ksfNHoZVXAmU
	5HIjTxvKtSVpDy5VSkz3w5fYNcZzkUFt0hrL1F/4vrbxxCwGEx7OI0GOV+b0HKKXB9iwozxbIY+
	sPMo9CRc6svCVr9W6Lv+ycwrkv9gPFTMkTB96xgGhujzQvn5y54p0nFRjkW9ig/pkfAA6x660V/
	Z68eQhrKhHsTJYGHTjeuwVYQsukXrtCqHacuyuU4LESjn2JGMrB0wea/fR6WoEuG5FHVIPVRAQ4
	9YBI3TAEA=
X-Received: by 2002:a17:90b:4acb:b0:3b3:8094:321d with SMTP id 98e67ed59e1d1-3b3d07aa6e9mr4435691a91.32.1795072286316;
        Wed, 18 Nov 2026 23:11:26 -0800 (PST)
X-Received: by 2002:a17:90b:4acb:b0:3b3:8094:321d with SMTP id 98e67ed59e1d1-3b3d07aa6e9mr4435659a91.32.1795072285666;
        Wed, 18 Nov 2026 23:11:25 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4057af4e2sm1243414a91.7.2026.11.18.23.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:11:25 -0800 (PST)
Message-ID: <553b354c-70f1-4b3f-955c-17a197e6ad20@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 12:41:20 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: master: Disable slave events before RSTDAA
To: Defa Li <defa.li@mediatek.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
        mingchang.jia@mediatek.com, yuhan.wei@mediatek.com,
        hao.lin@mediatek.com
References: <20261106062236.564607-1-defa.li@mediatek.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261106062236.564607-1-defa.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gLWCCiCPcViJMIN62OLWD7HWUZHCQ6CD
X-Authority-Analysis: v=2.4 cv=c5Q+0h9l c=1 sm=1 tr=0 ts=6afea11f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=mpaa-ttXAAAA:8 a=qpz-AGu6-bpAACMkIr4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfX6huR6ZGIQuBs
 18MzVMrp+NWHVBhgcUgBZ9B1lL+0wL7UV5zAFdbnUB51LXf5jWqO0cfeOLp3yFolVTLEqcn7yJN
 96QluIISoY1aLRj+JUoHcIk/mi45cWQ=
X-Proofpoint-GUID: gLWCCiCPcViJMIN62OLWD7HWUZHCQ6CD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfX3cvZph7ip5vK
 50iM/s8i2/X/mRW8MwSMegcsBTLdkRMcRFPyh0LDVMGrEoqlCZWugsmTy+ty2JrKoy23rMX7YuO
 LJZ7LuD5qU2tN3aQL+mDLqXVdHw5PgAJQEubePidupl97oGciojAHd69TYRiDnGM55CEOeIrOtA
 kdNBTEqeO3G8GWlLT6U/uE/oX6EkpTVogE5OZ9NVoclWtNe2GgNtRbTyERKyS8QII5TDVGxqOnq
 TeVDmspBkc31T9D2WnQjdD+GbSYJNTCopWgGXl7lxQsiy40CqqVeTuwTce0GRTAdYWwv5z1BPC8
 ZIshDXos0D5ZAUIja0p8nUEpvJKpd6QDCg23ONCWTUvoUYur/XUkeulrCC5Y1dQnYG9WKfb/+hQ
 QQN1/OQt2NlAjeUuTCTXgj0G8EU84kPvyexwkvi9tBtemfssy9S1g9X5Jlg+r5r8BAdzF3r+gsU
 trpG+16neNST+t0daGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_231129_145494_247C4469 
X-CRM114-Status: GOOD (  21.18  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/6/2026 11:52 AM, Defa Li wrote:
> Bus initialization sends RSTDAA before disabling slave events. A hot-join
> or other slave event may occur after RSTDAA and interfere with the
> following DISEC command or the remaining initialization.
> 
> Send broadcast DISEC before RSTDAA to disable SIR, master request, and
> hot-join events before resetting dynamic addresses. This prevents slave
> events from disrupting bus initialization.
> 

While the sequence you suggested making sense to me, but i am wondering 
before bus_init, are there really a target device getting powered up who 
can generate hotjoin ?

MY understanding is, post master registration and bus_init only target 
devices should start life, isn't it ?


> Signed-off-by: Defa Li <defa.li@mediatek.com>
> ---
>   drivers/i3c/master.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 01e05bad8661..4fdc8f721364 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2571,10 +2571,12 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>   	}
>   
>   	/*
> -	 * Reset all dynamic address that may have been assigned before
> -	 * (assigned by the bootloader for example).
> +	 * Disable all slave events before starting DAA. When no active device
> +	 * is on the bus, returns Mx error code M2, this error is ignored.
>   	 */
> -	ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> +	ret = i3c_master_enec_disec_locked(master, I3C_BROADCAST_ADDR, false,
> +					   I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
> +					   I3C_CCC_EVENT_HJ, true);
>   	if (ret)
>   		goto err_bus_cleanup;
>   
> @@ -2585,12 +2587,10 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>   	}
>   
>   	/*
> -	 * Disable all slave events before starting DAA. When no active device
> -	 * is on the bus, returns Mx error code M2, this error is ignored.
> +	 * Reset all dynamic address that may have been assigned before
> +	 * (assigned by the bootloader for example).
>   	 */
> -	ret = i3c_master_enec_disec_locked(master, I3C_BROADCAST_ADDR, false,
> -					   I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
> -					   I3C_CCC_EVENT_HJ, true);
> +	ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
>   	if (ret)
>   		goto err_bus_cleanup;
>   



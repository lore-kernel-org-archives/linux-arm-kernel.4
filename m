Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA21606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vwIR8nNf;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ssm+gfrs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aIR/cUNa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ahdWjaO9CBTxTVWPWfQbIkxMdhbvv1aJvET877LwySE=; b=vwIR8nNfOf47bS
	hcW7snbaqGVfrLukEUJfA3aKKmsuFzsuH1etN8Lav6n6Akhit7rMrcySq8m4qej+YidugXJlEoAyo
	x7Fu04HYCaXQRhenLOYcOsdvlabUBZuQ+4eoaKega8zA1bth++RLM6DHaa0EF2wZ7Z+xT9qMGKH7u
	JzU4ZUTzE2KXn3hCmiZ3F5koV0YJrSB71lf8TB29qhlAmOnHDKgRdDDIiDM9QSKYIPr7/PkIpf823
	ZCowHh1jn4xflTEyybQEjrrrFX2gameHz1aArpU6wX4qfTLvyF+LD9Xwl8FdmRmtjgtqTgY04DLUd
	aonpCo42EqlmMMlnPIXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPrw-00000000tru-0hEt;
	Mon, 09 Nov 2026 13:57:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPrq-00000000tpG-3tmB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:57:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFBnq359256
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 13:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahdWjaO9CBTxTVWPWfQbIkxMdhbvv1aJvET877LwySE=; b=Ssm+gfrsD1ev3JpT
	ihtLKigOBpwpsIOlBx5QTmYQY4VnX+AKrqPHUInLe30mSrde2HDxKnO3Z2Ns+Ze2
	EO7t5nkRA8o/ot4Z5RFQY53LFNoD0MZPJz7Zw3eTD1KT++R8kiF6N35V2typEA8D
	1Q/lnBh4L1GI0dUIS70i1+q4CCAE6fnkUuezvDVKiCMtXyCBTZ1PB5hoGSCYdSNE
	Douzjg+4uMqPnS/EIRy0czCrtzxmGaPWxIJVpg0UPPcSCVMOUpo2WCgKEMgL7YQS
	psBSFB80skxe5u8NrdFkT8OmYY+tbvZFk7rlmTQBDxbpU0WA0GQ9Z2fAWrrYLzz7
	kvBCKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2hwrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 13:57:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9460411fce4so14735685a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 05:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794232621; x=1794837421; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahdWjaO9CBTxTVWPWfQbIkxMdhbvv1aJvET877LwySE=;
        b=aIR/cUNah6ayW5DUHMLHb2tpxqS01XuYr2W9oxqggk0Tpj9HekxhDJQExlI9Q14cs7
         gpc8f0Nj4TWHRFoV/YU4hHJzSZJ4/aT/acEeLZTEyKnVYZ3fUb61crkKxnBLvbPNQXYC
         ttnUdXafBKLHKmqOgajLT7TiCv3pRELi7UGfLfG1A4VOH2abTzaROkEcfH11O101bwVn
         Dx/HNsyzMmajCoCyTU3yS1M8GNCVD++ngRuewpGw61zblG1/GEGzYpTRC6KNsw9LsRYG
         febtyCaQQebu8YHWFFNy31n0WVXwdWDhVnYM7Ge2cnRNMCJRjGtGRXuvJoVe9dG8giBU
         8+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232621; x=1794837421;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahdWjaO9CBTxTVWPWfQbIkxMdhbvv1aJvET877LwySE=;
        b=wtM/H3DnWYKT3eEtC3hX1D0NWhwSrcaFUdzGwaZVrhdRUNjqHotgp4OWPV3A5S9MW0
         IW7ycC29q6Ps+4WZFccFBvu38XfuOMa1kIif8nm2g1bexyBcXBBVbWpg7YkjhjhilTql
         z7G2WmUydbs/oEY9IXudMe8s49mWNUOXlGJ7Zd0CW6lfHp54DquqNiFB/KO8qKAWyIPk
         FJZm/ORyBNGlSPQgdz/kpUdFY6gqNN2EIqj+0KvJPmpCwym3kbtClmPYGCx0Xyx6/Dxe
         czFgtBcda+RIpZryRaZwJD1PSXC/7zJab/H8AXfMJqpl3/caWuYKKxdwzDP+5FsVdney
         htEw==
X-Forwarded-Encrypted: i=1; AL+hErGLX4P6QG2rysCpmcdwyq5jxzWJ1BpMmf0Iq2ZTLt27kk8ilhkOeBO85VlVjcI3BbP7gKgJTNzu3zWaiutGGtPB@lists.infradead.org
X-Gm-Message-State: APuU4Z+Xdn2fAxk8y9UnJ8PgnOJedRsa/NbI+2ZHojPH0W6TlaZf3adx
	N4SDQKRvmXIfCdIeR0hsK5iuyR09tM6z8HkD63jRRyAu+Em0aFJQQBPEUXvTEKuHlmf25sWAR6S
	K5SjChO8I528uIH4ZyF1NT3lLMQAzfnKXq9Y3v0ejxAyk2Z1Mfu1U8nej982QwxHKOLNi2RKVi1
	JYIw==
X-Gm-Gg: AYBFou1lH8KlnxK6A4uzHiNv6hF/XAvGE1FUqjMYezbmRoDztKudEneJUqFxSkWqtra
	6K27Jbrn00ehAk/TLa2zpeUK9kbVX3mHYiZ5gm8/JNTtC5Kx/ZdpGtNMX14XkldQ+Jd4mlAd2YR
	e5Oe1BuKAsjyeNsxNWhZJjd26CvaFrVsNSdP0MpnAelk/7dEn9HOnNcasejeuoI6QMK10tCaBsD
	xXThXfiyi3M3I5gQh1TD2yL95i49AHDlf0tUAbLeuLGNf1qroEzTX3M2JVcqPRSQXbcraSR82AU
	bnTcgijqYZvBpS9fkM2gZt5nkxRX9weV79LJYRbqe91kcqTUHZlo6Y3Ci0ZHutiFKa09vaTP3B5
	EtKcPQvPgNWqRA/HmNc0YH71d3OQXMdBCPUP3hcvDamL5BCDwRxdFGe07UO12uXjm3YBWog==
X-Received: by 2002:a05:620a:a897:10b0:945:dc04:c4b6 with SMTP id af79cd13be357-947842e6da9mr595078685a.6.1794232621058;
        Mon, 09 Nov 2026 05:57:01 -0800 (PST)
X-Received: by 2002:a05:620a:a897:10b0:945:dc04:c4b6 with SMTP id af79cd13be357-947842e6da9mr595073985a.6.1794232620528;
        Mon, 09 Nov 2026 05:57:00 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a4aeccasm178463066b.56.2026.11.09.05.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:56:59 -0800 (PST)
Message-ID: <747061c1-def6-44ed-af18-18c4b7c2df09@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:56:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] thunderbolt: add platform nhi driver
To: Sven Peter <sven@kernel.org>, Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
 <179407827117.165429.11777170722243752189.b4-review@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179407827117.165429.11777170722243752189.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af1d12d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=mpaa-ttXAAAA:8 a=KjD6htFGCqKMDmwFDkwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfX3LMkOXdfiHnk
 q5yt0AAGxnMRGD9qy360hiLCmFf6gJbn1foANKe++Rr4uCtGEHMfgmfMw6FowAxv5IhlgTTbwri
 3/YQ/tYRZWmhptcbttAKJa0v+UogiM6d1Y0JiPhfMlz0zaTyfZ2SPS+xCx9ZuqpPDWVxMC7aPm0
 VzB7A+bf1cITAf9t8DN6cg5+Y0e+1PpmwQ42JyGc1PIX8+OdU260dnaxOxIMZlD5fHLGyvvu0k7
 3OOYn44U90mBHSKNyKtt1fodwJfAWMDldk9BeecSylNFdPnGiJfgNyBGefxsFu/mA5mdauRXP/r
 y4zFKvvy0Eqm/Z+sa80EVd4/qJ36cTWPHVqhmEApGomY59DLxFVwBJLiY/FxSJ7Ojd4NwZVFWfV
 YL1a08IOhQYIeLkqzXwVCMDykp3uHdRyqvxVVJKQEpUXgZfGBUjFygtjm0DJ/snrcpjM8zkN+V6
 qB7Br1ppXtlg1DK9jsQ==
X-Proofpoint-GUID: MQgUE7n1Kx4BU7h-4cVZO2fR4Mbk07sg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfX50TPNUVNYLRq
 WkOzlFjkoWH6kD5/iGMbeQlyysSTyfKLL5opiMmGYSZ8JvPRCSO7KCE/exz2J8yg9TrxgxKfxYj
 sjtQ+9KYhRSXih6RRtTUGV9UeBQvSyY=
X-Proofpoint-ORIG-GUID: MQgUE7n1Kx4BU7h-4cVZO2fR4Mbk07sg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_055703_637372_5A4482A4 
X-CRM114-Status: GOOD (  27.72  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/7/26 8:04 PM, Sven Peter wrote:
>> Add a new file plat.c to register platform NHI driver for MediaTek
>> mt8901/mt8992 SoCs.
>>
>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>
> 
> [...]
> 
>> +
>> +static void nhi_plat_shutdown(struct platform_device *pdev)
>> +{
>> +	nhi_plat_do_remove(pdev, true);
>> +}
>> +
>> +
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id nhi_plat_of_match[] = {
>> +	{ .compatible = "thunderbolt-platform" },
> 
> Do you already have hardware that probes via device tree? You'll have to
> write bindings and get them reviewed before adding any compatible here.
> Generic ones like you used here aren't usually allowed.
> 
> If you don't have a dts based platform I'd probably drop this, not much of
> this code here is e.g. re-usable for Apple since they like to think very
> different, see my series in [1] that I can pick up again now that we
> made progress on how to represent connections between the NHI and the
> protocol adapters.
> 
> Not sure about qualcom since I haven't seen a series for the NHI yet but
> I'm sure Konrad can comment there. I kinda expect that it won't have
> much shared code either.

We're in the same boat regarding thinking different. This driver is
for implementations where the underlying hardware is abstracted away
(be it through architecture or intermediate firmware) and the TBT
layer writes are enough to e.g. power sequence the connected buses,
just like on Intel.

For the OF compatible, we definitely do need bindings and I too would
like to know if this is actually exercised - if not, we should cut it
out and trivially bring it back when/if the need comes around.

> Take a look at e.g. more recent drivers in drivers/usb/dwc3: They
> usually add a dwc3-$vendor.c file that takes care of all the
> vendor-specific quirks and that ends up being nicer than a single
> platform.c file with tons of quirks and separate code paths for each and
> every vendor.

Yeah, this is a nice parallel. Adding to it, there not only exist
dwc3-$vendor drivers that take care of the additional registers and
whatnot, but also everything around the USB subsystem - PHYs, perhaps
some NoC drivers, and all the infra that feeds into there, and it
compounds back into the size of some of those dwc3 glue drivers..


That being said, the makers of the spec probably wanted/expected the
hardware to have exactly this neat level of abstraction and I
wouldn't be surprised if more designs end up being compatible. Or if
the platform firmware makes it appear so.

Konrad


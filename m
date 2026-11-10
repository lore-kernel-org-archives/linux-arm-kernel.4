Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EAA606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r8bZ8PjB;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a6P0WZkg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RL6+x1bK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=izXQc1m6uJs2OWW2AxpmmxzIFdzwjCtP0swelOYB4Bk=; b=r8bZ8PjBCfTnI4
	YCjYgVauoGL/3L4KNKymZRd/lKW/s3fy6DdpkW8K2i4ic7Abp6bWX0XimijmrCEKT+KGzNgkyMLfK
	ytYo0FHQeqbOAQ9xY0+3HMjhBhiSFIYv3NWqgwRNJOgaNCLRpqOAXweDi9PEDvQyp+6cQsjMoRkCi
	HVexPLmgOjmMFExgMK+xd9wjIv2VWQgYtysHmrR4W83T819P3jJihamSVujg9dkySUMizC6XrMHow
	iMaHPEXvcNswjdGuwG58vjWr/WSCBarOTPo9AoWspm78nlkEzBMWaPH0+PPUGLw9ZagO1mW9UWeBt
	WvIAS2rwAADpCQrj1hWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlCo-00000003u7f-1ekA;
	Tue, 10 Nov 2026 12:44:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlCi-00000003u5f-2MOg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 12:44:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAB9qvA3228354
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 12:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	izXQc1m6uJs2OWW2AxpmmxzIFdzwjCtP0swelOYB4Bk=; b=a6P0WZkgTx1O2z5a
	eWvoXeu/0YND7aUSKP5NBPSFRKeZ2/KKO5D4w29QG8P3UQWrpBMkVqdskm5O5oEA
	efin8cyC/TZr0KiA18DPQXtTztS7HpioE9p2D7D+xk3B8H3WAWRJuEhXlzRAvc9R
	21XrmnF8MtzVpxfGWnCbNzzD5fXjZXsB4RQMSoTmmpvo6zMv5okZwuxJCFu7BRaF
	TNhYLXWyfh/DR2BltLc7Ehdxq6cDHTPwr+Jq0rm5XMHJsNkTXiLlYIcrWsVKqzEM
	AJoywVsm+kaFybTO1z7gRkOMQOC0+Ck8qC5FfVto1fD3jSCOheE6rdWGp/isb6Ge
	8E70FA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huy5d91ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 12:44:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-943fffbc5dbso43031785a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 04:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794314639; x=1794919439; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izXQc1m6uJs2OWW2AxpmmxzIFdzwjCtP0swelOYB4Bk=;
        b=RL6+x1bK9GVX/+kzYzACw8MZDMfkRO1G1aAffX0sdJvrVuavVxsyfZgF/G8QKn1YTL
         m+Qv224sAjh2VN3ERIqYeMmq0Y+Kr0z+xqw7bF4rtwZEHHzyhTfdBmM8dbW3WzNk1buE
         ehqmomdzpigTlyNMmjqOjpgDnKT5FoTDaG8R8SGdqMxOF0NY1e023SXOJ3il3rd1sSPq
         dZp4l4ErNh4a2BCMXIMJCLMS+TwBSMYl8/efdSsEHSx19HT9uQDW/qYwY3nISUz86lP4
         LFToxsAJ0eTY+8CFP02h0wkNWLbAChD/9hzfegbZ8rk+vBe/AH57NAPXfU1tc2HSxWd9
         kz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314639; x=1794919439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=izXQc1m6uJs2OWW2AxpmmxzIFdzwjCtP0swelOYB4Bk=;
        b=ozWiuKhRNenp9rmeFmRRMmdiW8bPGc05VdHjnfCcQWY4I6mHVnkcHQq3GjPnwbb2Tc
         ref8w1pVRi2RemxUuPS/HOJPK57wKiv26d2cB0pMdGFf7onS3UwkgANZDtG6PqdWystg
         lxqq3Euz/EzX7kNsUfYtSkSwq93fqe59UrZH+3uKG1XWFG6Io1VP7qFTy/QnrakBUzOK
         1IqxUTu1gwwWQf2qcmRp+i/2wiyh9caI42lzV06z4FyRKZIwENV0BP3iHFxXB6D9FwC6
         tfLcreYLvrjIABkuXwmRg7chXVMqPj564czpamhBaLZDnkEDsB4NlReyD8HxGc1WwrGh
         mUaQ==
X-Forwarded-Encrypted: i=1; AL+hErH6P96AdzmNkii43KGAU9HHVBKd/FZpqYN5lzdcAzQx3/vLq1F+rYrcOe5AVtxznctc5n0XgfKJsA+0n9gNC6mk@lists.infradead.org
X-Gm-Message-State: APuU4Z9QsT8jR6BkqZT7jwzGT3a9ltkn0xsx/SmCxZBauijmQf7GS5Ji
	3nwgWCI+iS8VwAY32Ro6ZRwnZlwFYkF0ZYjQW01nxHkWJ+mrWn1/Dk2b+RdmH/C3zizu9rxUkJp
	5i/nHUJ2ON5d1yorqK2qzp0gZWoFbQjsevNBgLGFQ0NA3CKSOWjdsXa0YtewtKsu4kmVhebInGJ
	incA==
X-Gm-Gg: AYBFou2GDDHPe/Ul5fShD1OziUbht6YAbgNo2aOpHvYjUm+P08u2s8Iidl6lhJJ9Hrv
	b6XPfyKnMMif7evBtl3FM8RcUAJNOPuT9uqiQDsJbCL5WOY3v1m128MqRPzjgQiUax04E0yOm+4
	ue79UEM6UHzm48gBj9CwkOM3E1xCnI/D6vka0bWgvanwNL2o/wyOoL2e8LaxQgpu4FeDhEHEv02
	KMDrWMtWc+cZkHgqPZFVSMSlxcdv7XnF2Ob3mirp7BXD/DiwtZg2BX3zyM5rsnxijfnValpIp73
	nlHkqzW1J5nQfAZ1jRlg9L7WBy2MgbLgYFMqmfZRNElBglFXMxzfMUITy/q+Xcww7/7eY/8M0S/
	6vsMGV6libdDhN8V8vjjT4ZRJN4GT57P6DP2i6GEC/p1mXt+PBYxEWlxn11wmiuxpeljBwxo=
X-Received: by 2002:a05:620a:a2d5:20b0:945:cfbe:816e with SMTP id af79cd13be357-9479f3d6b39mr352548585a.4.1794314639166;
        Tue, 10 Nov 2026 04:43:59 -0800 (PST)
X-Received: by 2002:a05:620a:a2d5:20b0:945:cfbe:816e with SMTP id af79cd13be357-9479f3d6b39mr352546185a.4.1794314638695;
        Tue, 10 Nov 2026 04:43:58 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6551efsm103736966b.68.2026.11.10.04.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:43:57 -0800 (PST)
Message-ID: <830a0984-8938-40f6-9400-5962dfbbf274@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 13:43:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] thunderbolt: add platform NHI driver
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>, Sven Peter <sven@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-5-chunfeng.yun@mediatek.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261110114925.722014-5-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: M02s8q5DiHmICQGmkKGTzXQhk7pNlAJC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MCBTYWx0ZWRfX6V6ITRzKRTi6
 CKsmTCxKSz1NS0nkgWeE1xYCbMnFCkKa2ofnEugygFOAoWbgAJSFlwjB/EYrFEuGFJAwFg8JxRV
 3ld0jKhGOVIComHtsDECAvvzljBrKN8=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6af31190 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=mpaa-ttXAAAA:8 a=1GaHgJMAeWfMa6zh5XUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: M02s8q5DiHmICQGmkKGTzXQhk7pNlAJC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MCBTYWx0ZWRfX9enIPjEoURP+
 6EgCg+rJhYeBGx0U2gkpVruASBNCWsGJHNkD+TM8cR0JrN7HRizvfiJgG5MnQ/DYHHyVkH6U3d3
 ZPTRiCYkmS0L6c2dIrVfs2yzt2iAN4Q8Hzw2Es/hPbeonM2hlECc28M6F/kZ3ocWJNccL2VWyEe
 CVv2QrKe5DX0RqT7gu9SQTH57gVb3487tVe07YOWSiTOHhTNeYGUAS9jxcsSo0fr/ZbcMqzPtJY
 D1hXublwSkp7/Uqh6p0AFQwTYV3GVhjqSUVPS+0YpP/24zkY8acU6ZmaxKSN9VetLaVKMRLGlo4
 rdO4l3SHegOsJ+3yGi7qysslKtZqbyrTtQnc7TqiRWCS9Euf5A0dh3ZGgNKreaaNwDsoxcqDswU
 N+Fc4IfiTrnum4HgwNx7GL6k6SxtyKnyUR8r3S+hnoLaHTYyp4sUC5w5X+PaPgv7E1nceqx0iMP
 /p/5vNrukB4P2PHeD2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_044400_615371_EF9F7BBD 
X-CRM114-Status: GOOD (  20.92  )
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

On 11/10/26 12:48 PM, Chunfeng Yun wrote:
> Historically, the Thunderbolt/USB4 Native Host Interface (NHI)
> controller has been exposed as a PCI device handled by
> drivers/thunderbolt/pci.c. However, some SoCs (such as MediaTek
> mt8901/mt8992) integrate the NHI as a memory-mapped platform device
> described via Device Tree or ACPI.
> 
> To support platform-attached NHI controllers:
> 
> Introduce platform.c to register a platform driver matching
> "usb4-nhi-platform" (OF) and "ACPI0015" (ACPI);
> Implement platform tb_nhi_ops hooks for pm, interrupts related;
> 
> Support an optional dedicated wake interrupt: on integrated SoCs,
> the MAC/PHY reside in a power domain whose clocks and power can be
> gated during sleep, preventing the primary NHI interrupt from
> acting as a wakeup source; so add an optional dedicated wakeup
> interrupt which comes from the always-on power domain.
> 
> Clean up the unused nhi_enable_int_throttling() prototype.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2 changes:
> * Added CONFIG_USB4_PLATFORM to build the platform driver as a separate
>   module (thunderbolt_platform.ko), instead of statically embedding it
>   into thunderbolt.o.
> * Renamed plat.c to platform.c, renamed internal functions from nhi_plat_*
>   to nhi_platform_*, and updated the Device Tree compatible string from
>   "thunderbolt-platform" to "usb4-nhi-platform".

There are still no dt-bindings for this meaning it can't be merged.
You also haven't answered Sven and mine's concerns about this being
actually used.

Konrad


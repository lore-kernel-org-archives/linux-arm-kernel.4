Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453BC60A2601
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H/ltvKdp;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dfOkZ+eH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifA6RjGI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MatU70aFGzUpefEfOY9ZfVcRCCMiI8u0W7ROj7FQCKI=; b=H/ltvKdpOIWbPG
	IPkc7695RSjWy3RkxKfmaQ+M87sEsAGrTnNkO5L3LDgMkZ6WH0OTxNQMcG2kGGWQzmUdFom8msnIk
	BBxdMqB+zF9wEjPMxnI4trlvOWQ5BUYK06W4tn0NCPxjsb2fSaK07QcUHELldhU7abe4q6jA/OrMO
	MEX4ku6cpfDsZD28Uy3IXb5eyqWY9U4xAM75EdYkbk/9xCgtMEO6AhM+p7XSvcaErZfY0SqMK4kQX
	G6lNWypSqW1zcKCfcQcjiEJofRvP7VSuU4xdV3lMtLwcwQat8X2PRKRR+BersrNSFE2Frq2B9dSM4
	23GEq6koSfyLu/1SY+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlBE-00000003tfz-0UEM;
	Tue, 10 Nov 2026 12:42:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlB9-00000003tcu-482o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 12:42:26 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAG1V3839681
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 12:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MatU70aFGzUpefEfOY9ZfVcRCCMiI8u0W7ROj7FQCKI=; b=dfOkZ+eHCzjaObQa
	arqogdPgi6Sicmsw8s9UW74t1KaD3DEI8mGFbx26JErUorxPHUzWEhLVmrhGkgKc
	SnSkCuZ10nJaQ4jut8xSzy6qwkEpRGQxeVOqvTow4lgJu2h9f6w1fSaC8VDskXE1
	qekFaTr8/B4uo8/SSpYz3kcMzuum5Do0ar6cP+F1xDH3Sgz+EFIJbW4gprKmP3LV
	+1Q45fBRG5pzz9b0q0Sq3NiN8WO2w8BLQ9n70oc38FEvFGghOVciXjt4RrrXPRp/
	0rQ7TPy1mnCzCz5lIpbISeh+1TfLVm9bVfSGxzmDkFQn8Olvqg9vBn6RwBRcb1yu
	TQh88w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg3ejj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 12:42:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2bdebfc5so55702085a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 04:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794314542; x=1794919342; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MatU70aFGzUpefEfOY9ZfVcRCCMiI8u0W7ROj7FQCKI=;
        b=ifA6RjGIEHFpPWyEZlAYkdcmQ60qBWutofVdWe45+ITHR5ALoeGxTYUbjoh9S0Ihx+
         gbbIUtDlvHK+vT/BhyqiGwnll0NbpnlBVtx5Zm5ySY+3LGkO4geqXI8VL0Nxy0TQ6je/
         Q1DQrlwXpLAShUgyqCVEDIuuBtQER9fjicDjMXmqH42Bw3k3Bu8sLErPEauOyELKYrDO
         UFk8UXuB/OJzSQNnmyrecmFHYuKucR7iZxOP5Z6hiC2xHPOKc/g/kNDpSlihiuH27wy7
         pTrChWyK6kBwBSBPf65xtQbmckw69rbYroJyGzp6rwOulb8JiXQIN+Snk8g87WMzp/IO
         WtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314542; x=1794919342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MatU70aFGzUpefEfOY9ZfVcRCCMiI8u0W7ROj7FQCKI=;
        b=Q6Pqv06cXQADdqZPQUWkBCnXg+Xe3EXsAZGlKzBEYiz9nWix0xF71VskyhIxjl8/na
         qw7j2wgTRczwaTqCXEt40b1uuJyy+o6z3lOCNKQOv6Px5iN8X/KKGUo1qxKNApt6FjxI
         2Oy5akt7uYTEev3+WmAlvdQZnY9fOD0PzrfONWoM0ZJp8EflgNYLNTvD9Mcdz7varJOb
         Uy58GDDwycc034w99F5IQK1FQYcL4lANtHI9QYjMRwGdJtcRp2O9G6KBIJcXVkZyJIHf
         /3wvuk0UjZTiPEvdcUWeFOiN0g5bTdPhumkCDZcml/DkBm4kWkbvZDRGLQjNIRXkqcRQ
         525g==
X-Forwarded-Encrypted: i=1; AL+hErGk7X0XeoUrznwO7opY5OPZeqM99SruCWe4BoIB/nzt+liIsdIWhwxnN5s8UW2zcI2FUxbkDCi13KKd/ABVmzlM@lists.infradead.org
X-Gm-Message-State: APuU4Z9on73T+bKhenFOdH0hPLPxrtr6ohfpEZPmJ9JicPNzY3yuUOfa
	4iq9zvx/h5wqjmRoZuF+j+WTWB1AFaLM6hFSXBP3d8HjkbTAl6RjvfIvJz4E2p8Nu5FWQZ4Dvc2
	uauX4j9HDHV5kiiNO+covFIhHIFtf0NOYA3eOxo6GdPZ32BXi0jYlVFiND9uYBMn5A6HFJaAGfK
	69FQ==
X-Gm-Gg: AYBFou04L8/vZmMoXgOwIZUzLeKHyOURI2G+bZSg4N/yHcFvxjZlXKs1/Ju1TzfMAAh
	ZmgAGKQ/Ek8HtUjjFGViw31sI22fl6XS8eHtw/rEGJXyteloQlYYfv8SLLYMps4hE6J8ZBDbQyc
	4hcacBqblC0Wk+x+80uKIrBasQrNh0djEH5C01NfBu7mv9HVSbKc+zkBYu23UnsjZ+sc4KtupC6
	vWXRtRf+vNdDJTvdJir66ITuj3wsiG+lAqK8Elhg7yP2adrDvx+JvKiwaruVIK6RiLPPtYcOF1J
	2DziJ48wiECtchQzow1q1a3cgbheAj9X1xs1ihruEIuH7ImG2yrg37A/MLggmv/oDG1delBnLpz
	xwJM95R7IFnHLIkhsZK7Ee8Q6XaSxyKZ1gnra01Ri45r8fAXcnrQW/gFC61BzPCu+RQzdj/Y=
X-Received: by 2002:a05:620a:a2d5:20b0:945:cfbe:816e with SMTP id af79cd13be357-9479f3d6b39mr351995085a.4.1794314542082;
        Tue, 10 Nov 2026 04:42:22 -0800 (PST)
X-Received: by 2002:a05:620a:a2d5:20b0:945:cfbe:816e with SMTP id af79cd13be357-9479f3d6b39mr351991585a.4.1794314541623;
        Tue, 10 Nov 2026 04:42:21 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a66b9sm103217466b.9.2026.11.10.04.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:42:20 -0800 (PST)
Message-ID: <7fb5ae20-c4f3-4aad-8d7a-a37a6ad15fb7@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 13:42:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] thunderbolt: Prefix NHI core functions with tb_
 and tb_ring_
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
 <20261110114925.722014-2-chunfeng.yun@mediatek.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261110114925.722014-2-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MCBTYWx0ZWRfX8I7JPngdCqG4
 YUqqk/os/5m7vQnekU6xN3/In4fW2WN+0IUr+3pqwon19//vJ4VkmUN6C1odDdQjqN0OJ/4gfyu
 I+zCmji6IBCnE4WlTg/mwJACqpJ4sZiuqxEkvZeaTWEeL+NPuGSV8lJX1DVsNAY7aBRXtqGxMqZ
 AkpOyUr4ZSfEgoyRRu9oc0JVbsP8AGk0PpLQF64drJXtMzjnaNxu4kh4onYPCe62my9tGsmSQ9s
 4bCW/kXvSm8gPPYrYUIJew7JmA4JYYHle5evFKLdX6RO/R5mg9Ms2U6pxVP0P74kmKoxQh3hawW
 UsF1OkGsKepPiCGRTypHADnVlRbtx+oHyUb5slNYO3DbEQa2GTNVrWQOd+JIGBVfNqfKa1+eQbY
 PTu1nBriwZYyxgzbvCaMEZm18tRCLtchtgcxswwDsq0j9AY6Lo+cM1D+Df8nqBCTqw3ikQHHMto
 /p9kLF4Ym2QCI6Tc5aQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MCBTYWx0ZWRfX5582+VZTvlXh
 8ZmS5LZI1hrMB/2cMTx29QvyBTt1NandB/e6XlflmuT5hbe35d5pSrjqOKzCCQImmzWQuLtaxoi
 IGFjt6DiMOEGw9UbRADILCWzw0oiqEI=
X-Proofpoint-GUID: GJzj9KPhZUvmp-Bw4m5NW3QrOiQyUAGY
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af3112e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e4OhxiAmdoAHhBioD_AA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: GJzj9KPhZUvmp-Bw4m5NW3QrOiQyUAGY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_044224_142180_216652C2 
X-CRM114-Status: GOOD (  16.26  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/26 12:48 PM, Chunfeng Yun wrote:
> In preparation for modularizing PCIe NHI support and allowing PCIe
> and platform NHI drivers to be built as separate modules atop the
> Thunderbolt core framework, several NHI functions and structures will
> need to be exported.
> 
> Currently, several of these functions lack standard subsystem prefixes,
> risking namespace pollution or collisions across the flat kernel symbol
> namespace:
> 
> - ring_msix() lacks any subsystem prefix and diverges from all other
>   exported ring functions in the driver, which use the "tb_ring_" prefix.
> - nhi_probe(), nhi_shutdown(), and nhi_pm_ops lack the standard "tb_"
>   prefix used across the Thunderbolt public interface (such as struct
>   tb_nhi and struct tb_nhi_ops).
> - nhi_msi() is named after PCI MSI, even though the ISR simply schedules
>   the interrupt work and can serve as a generic ISR for non-PCIe platform
>   controllers as well.
> 
> Rename these functions and symbols to conform to Thunderbolt subsystem
> naming conventions before exporting them:
> 
> - ring_msix       -> tb_ring_msix

Maybe nhi_ instead? `tb` is used for the software connection manager-
related functions

Konrad


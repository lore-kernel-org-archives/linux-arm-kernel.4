Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1A7606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 06:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sJVjqasi;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CiC5mAwZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZpqL/SG8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M04KcOfwG9b8qc/Tzo6l+/Fn22+OnPocu0yxZRNzOqw=; b=sJVjqasiT75EJT
	hjkXjHCbLbH/EX90v+JSygcg0eJGmleUo9rIiEo2CgZ/G+dngvnz7dh9aCm9tJgQ9GFo2QLtV3V2u
	68BRKxl5+RkrG3lss21QUSg6HrunPSTqihzqt3uW9Q1gG/uF0uvuydIZHnuCMLNcGtzPPAuZQ4cC0
	HkFnmzr7fxmpq3KzfW0gJ8lami8o/gOCOZGhPnIqCjVNxQjXRr/ZG8lcY3CgX4sHgDLhPKK1qbFXL
	L0Iql5vRum8xGLp1ibqOP7p76FxxzeL1K90/5hxgpZBVJe9fPIrcCLIHhzqE11QxyoKMVbm7r1Dzf
	z5hgYMgSjQPkWhJ6jLtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqcb-00000001LXc-3Mzs;
	Mon, 16 Nov 2026 06:55:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqcZ-00000001LXG-1akY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 06:55:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5Lb63214169
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M04KcOfwG9b8qc/Tzo6l+/Fn22+OnPocu0yxZRNzOqw=; b=CiC5mAwZQuhjA/3S
	vrccdDUJBeR/HCw0avDpc+baNEZLEHdQwnxrvTbCZwJNprg2nHmcy7AmmLoKRCk2
	VST4d83JLMhkAgKwusf+MBUj5UgOIt+PeNKoG3qvaaDXttwrTH6YiIK8eMLBLdMr
	yeiD1Z0HPTKTdPcuXQTJjO06e27AHKX/ucdjpFzB0HKm/isnMJLesQ3pkZJmP1zs
	Bf55cEGE/FxR6WyXaGT5zkdrHGwRUfWl0POTLEKNIDS3fFlUbOs69nfcEfmUYMqO
	UoNDDVR7KcFS+HTZQ/1g6TDwouAeOtJSlygJWoolxl+FSMPoOjSEOmnEZK+4gRjF
	VTIs0w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqnbab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:55:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b7614e9762so1952141b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 22:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794812117; x=1795416917; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M04KcOfwG9b8qc/Tzo6l+/Fn22+OnPocu0yxZRNzOqw=;
        b=ZpqL/SG8XoM5izHF30EBtZw6Rfm/bjzRv910NNSMH4DB+Uks4gsCROPqZrD/VpJJkk
         WEf4GiglLD0YbnKRHTwZ+L8X0OYHdzfmirhOYMfkAWy3drbSEM7RD9QEMFvtEw93b9hd
         Bf+dIwEDXQSE4eWP1obFSgNXc8pn0od/vEnQ+/8INmatX4xXfHtvx6IUZduwz9AocwPl
         NBrSekVmzHGmxJ0hymHXLu5J4RwIJ4+xPc/jdra0w8Hc+ubxv50mD+zYMG+o4REo31Vl
         W8dazfDf5IJ+EvpoYdySxo47H04v0TUeg8ezcaSCkDbjo+wWa/uXFij6DpZzzAunI+Sm
         6aVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812117; x=1795416917;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M04KcOfwG9b8qc/Tzo6l+/Fn22+OnPocu0yxZRNzOqw=;
        b=EsLV7k9r0/4xUVOiNmB4IYGwnO8lsNv7BCt7serubQ3NPjr8ABZZ2fuqO+qMrzz7kG
         +g7mUEDxGfU6id1WEnDoqiVMZxfYVFSHhrbRkhce9SShrquNCYq3aEpORuF2YufdksPF
         U8sr3hvrfjSX0MikyBfixO/xDFRasIpU1zCOW6EYeqJI1R0GU//yhs5mdAPJ1b4OlIxk
         7T7Ch0TZyOMFgqbnky+/ysuXyb/KBpek6bN3pXd50kCmKnsVNu2g59qlMDDMqf/V1Kfc
         E9cxw2pXmTcWn0Ma3zhDifA4YQNBCxfDwTKIcNibXBrr//BEc2yu6fLoVo/9HMTTZ3Ds
         mNyw==
X-Forwarded-Encrypted: i=1; AL+hErFdfTj7wlmPaf/wDUuM149JzDeI1QIfkpQmwfo3BwGp1Lg9fiATdGC/0ZJr89AqgUGplI890XYsiueHGb0GS3px@lists.infradead.org
X-Gm-Message-State: APuU4Z8nLaqfT4hO1J5WQN9zIZsXqE9EUNQEZ/fE9RAg7lz6qzkFKsgu
	jqTugSyBr3JbOkbJtJwUOyi+7TTjEAT/3b5Ndg0ocxvZv3Wcd3x/EVy1FeLc/k39rjoPQCPq5Sb
	VbK0ZI+SmqCnKp6+SjkynM4laenIdswyiNmEQv6mP1OiDfUXZtZRlw543qICkSvl/K94nrXlqA3
	cbqbnP7sRKuA==
X-Gm-Gg: AYBFou2hsPUTgR8HKunrMKMQCH8X4FM6fOIDHl6G4KJJCNFwzLvqVCNGKNsBSvS/g70
	gv+umpX4T9lRBbIzGHVNb21wGthEzQWozV1EfOAzptFf9cReODN0EhNgdhW62xbkfriZ25ekMso
	qWwXhyVKP9zxLdstMzXyGUn0xWYfUAxMff2k5czMEoDyWfK+3anjtwICPIz+agnMJghivmss+q8
	RYa93wtx7fUGUaWvKWmrt6u9/YkdSUKiiLcnHn5pkXT/BWYyu0CxSesT7szrczQL2GwXFSlwLjV
	dWCznv0L7/D69feMLPg5gMvsXIZUbkH8DJDTrDwwBgkgyz1NqwBlsebge3eeEtTqinkdAszqv9n
	SpFpEY/dhYFOtk1bPV9fIE11JGkCtquve7H1apTE0nD6bU8Ze/Z8thMWMwaDcxIda/R0HqVMwkB
	eMDnuNFrBywZA7HsfWN8ggfBr8jgYfDbd8/F0zA8ygSbA=
X-Received: by 2002:a05:6a20:c998:b0:3fa:1ebd:2216 with SMTP id adf61e73a8af0-3fa1ebd2b12mr3667896637.19.1794812116549;
        Sun, 15 Nov 2026 22:55:16 -0800 (PST)
X-Received: by 2002:a05:6a20:c998:b0:3fa:1ebd:2216 with SMTP id adf61e73a8af0-3fa1ebd2b12mr3667873637.19.1794812116086;
        Sun, 15 Nov 2026 22:55:16 -0800 (PST)
Received: from [10.133.33.59] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2829dcdsm3208979b3a.48.2026.11.15.22.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 22:55:15 -0800 (PST)
Message-ID: <01333b29-8739-4791-9339-45a66811fc51@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:52:56 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 02/10] coresight: Move CS_LOCK/CS_UNLOCK to
 linux/coresight.h
To: Suzuki K Poulose <suzuki.poulose@arm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        songchai@qti.qualcomm.com
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
 <20261113024935.3173715-3-songwei.chai@oss.qualcomm.com>
 <2246263b-a872-4a65-803d-ef1e031522f9@arm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <2246263b-a872-4a65-803d-ef1e031522f9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6afaa8d5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=HS0qQXPI_2Gq0Hqk6xEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfXz9aRGLxWxTAz
 n9oRMiRFFtD6OrTvZJUK8iyaD0rK/z1mksM/iDp8jbCTbjQDqIKDuBiVhw6K9+YmSvwxgW+7PZu
 yhbHy7DXLKjY1spBOdfGghwAegGYC1c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfXwNFeAVkFootu
 2WKtZYWbBq55X+WMdtsp8/QYfq/YEAhBRA6ziDk5MuCva/cvQ3C4vfttVxqToY3DOWeEHG3biZG
 4QFgY3oEIIxlL5WRar+Sw8YdWuBPxlmwrIl+6WUYDkSgaXhSu8tnz/9BGQGFn+tZj3t5whSOFFL
 3CsDTQq4va09B5mPKFbs78GStNkIMm759nfKFleWU9k4cltO5MXqvgziGiXOMX4gGQCSzz+OFKG
 Fq1rL8YXHUOzvBeWQML5xPDCYBmaPVNKHM8fw5a9Sm1FBBa02nB8JL819YeA8jQQ5DvD5BLnDvj
 6u7Z1p461Vitz5OilGznGQXeYFBUQ+Hd1j/57NeNjpUqQwy2mSA+xnMm3FCHjxf9V6FB8ypYrus
 3Ux8itN9gEUFlC0dXOnqWpyC1N/yGxM6lGEkT+o777ONpm+m3Lujg7zODqjrlHB7KLGpLIhffEb
 LQp4FQKRVhoEEcSrUpw==
X-Proofpoint-GUID: HjhYYq8L3mMVfGEBHldmllAaB5z-LqMZ
X-Proofpoint-ORIG-GUID: HjhYYq8L3mMVfGEBHldmllAaB5z-LqMZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_225519_557878_F0E84179 
X-CRM114-Status: GOOD (  15.19  )
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
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/13/2026 6:25 PM, Suzuki K Poulose wrote:
> On 13/11/2026 02:49, Songwei Chai wrote:
>> CORESIGHT_LAR and the CS_LOCK()/CS_UNLOCK() helpers implement the
>> generic ARM CoreSight Software Lock Access Register sequence, which
>> is also present on non-CoreSight-labelled components that follow the
>> same architecture (e.g. the Qualcomm TGU). Keeping them private to
>> coresight-priv.h forces such drivers to duplicate the exact same
>> definitions instead of reusing them.
>>
>> Move CORESIGHT_LAR, CS_LOCK() and CS_UNLOCK() into the public
>> include/linux/coresight.h so they can be shared outside of
>> drivers/hwtracing/coresight/ as well.
>>
>> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-priv.h | 19 -------------------
>>   include/linux/coresight.h                    | 19 +++++++++++++++++++
>>   2 files changed, 19 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-priv.h 
>> b/drivers/hwtracing/coresight/coresight-priv.h
>> index dddac946659f..0d3f6229b282 100644
>> --- a/drivers/hwtracing/coresight/coresight-priv.h
>> +++ b/drivers/hwtracing/coresight/coresight-priv.h
>> @@ -23,7 +23,6 @@ extern const struct device_type coresight_dev_type[];
>>   #define CORESIGHT_ITCTRL    0xf00
>>   #define CORESIGHT_CLAIMSET    0xfa0
>>   #define CORESIGHT_CLAIMCLR    0xfa4
>> -#define CORESIGHT_LAR        0xfb0
>>   #define CORESIGHT_LSR        0xfb4
>>   #define CORESIGHT_DEVARCH    0xfbc
>>   #define CORESIGHT_AUTHSTATUS    0xfb8
>
> Move all of these register defs above to linux/coresight.h. We can keep
> them in a central place, in linux/coresight.h and drop patch 3
Confirmed.
>
> Suzuki


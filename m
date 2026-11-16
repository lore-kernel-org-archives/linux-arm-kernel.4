Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A6C606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 06:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XRhFIXVh;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U0OaEmZ4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G4LpWBo1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2S9k1KDmjXj6+ft2VRTVkulkYwAMCOYGy6MlND8T/mA=; b=XRhFIXVh/1wUtz
	YjEeoz9uep0vnC27+UeVsSIDA6ORVA9dAbaCGDPQlEgGaFvxXL6/UM4tp1GjNd7gNG8KeCcljU6gQ
	dk6mq5ffvZjPD1B6JPDePj/rrL1/cmz09eaeX8go+L6L3wW253SEuffB0hRvrLY9ntTwtaXqfqyvY
	+w1+845Xhqyp5iKn/eKy34xvn7JrMqrtSsz+Aob2IvB9Hty72eLFESDuo/X7HYj1XQTj8Si5qNQb0
	qLTzKguBhchj1v2DyG5Wrvmj66zXqSF3P+YQH6S8cPYTUQQi29SnyRecsSaJurjbKM0BcatFzwSZ3
	3GiILA0i+pxunxinq3IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqcq-00000001LbU-03rW;
	Mon, 16 Nov 2026 06:55:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqck-00000001LZc-0KC4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 06:55:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LaVl1321020
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2S9k1KDmjXj6+ft2VRTVkulkYwAMCOYGy6MlND8T/mA=; b=U0OaEmZ49T45GN13
	5D8nLtZtILVSQ+OpE+0c8UPXOk1eI9DQEJ1v2QptQhynR9eSUqISXvRbAoWDW+88
	q3VuEi8BRBs/MfhXZeWjP1ldSVc6mt5huyT2HfNsAqjeyXRi2AfQx9otohAHwvqr
	KMQqF7cOW57/5+z7JO+Tx8X6uY66ybivBGiUP0EIwarxRqkMExVrGexnOr8wm8wH
	z8hnEWDN7BivDnR3WvZwPvCghc0SJL4rCgTWpJtIkWgCgnZHbwuF//fawy/sjW44
	pkacIt+68bHrWFHm5NGpvb1MPxhaJ1pMxTCRzx9YQ3YOvQ2JIYGOoMiYGWUuShqX
	avfQOw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhman5e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:55:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b69d1f2a18so1876486b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 22:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794812128; x=1795416928; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2S9k1KDmjXj6+ft2VRTVkulkYwAMCOYGy6MlND8T/mA=;
        b=G4LpWBo1+k1wqzO5E7V9zZoUidleEvgKRosZahllQhbSx+jtTJ92oo2Cx7Y9t5Hm1/
         FcJjDVuwDB6RkL/I0xOdyGrw/V6x9dhsmJLdUf8bQadggYK1zlv8pKdVLhLgkqLqk+7F
         HnjzS4uB1VXfAjjPSusnt3QIu30geWHxLHRBw79S1ehvPEWQbDHJO8c4ZsdMryDpDici
         LdcjmAkLsBVBE7YKpahW629tgs8pzVAL9CrHBjcBM1LALKBHWex6v2+iCgObdqrnXgsr
         T1d1QSZzQQLElqauUyP/T01GMLruBFPqgq+yMKX4WoFKjVy916l0Nl/VQ2WfZMNtsEep
         n8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812128; x=1795416928;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2S9k1KDmjXj6+ft2VRTVkulkYwAMCOYGy6MlND8T/mA=;
        b=qMUXlmi01ji9SAM/TEZbeBwbsfsLRATG13YEOU5cdke7LrBUNKLmo6CDS37LeAbcvc
         XQxWS3Zfwow6fME3zzLTVOS0Q6MsFYfQyA/A6jQ/t+1nYgktjs9K2SL317JYOvsTmDQ4
         lFDmRdVfX3h5pkBCiCPdrTX15JwjaACqqZMNrv0ttF1kTP2rAuSSQrWGcMr+B4UV6vuH
         CeGQtLbdJkKYUbPsCi+oeIzWwoE/ew0gsjnOts0uEB4HiqdynD2CWCdE2Vhm6fjyi0Gu
         IxYaMDiwuZ96VSzKhUqEluh1EwyhE/IhXL5IQBdKw0hguc0MkwYkDs5BSosnvmQgkJ/N
         ePKg==
X-Forwarded-Encrypted: i=1; AL+hErH7Enf4/osGCgDzoT0MqwflGcFo02g8W1ajEbNvO0Af6t008gSzBTIp+17rpYSeiEbXeelFMq4rt8l3kfIHTySs@lists.infradead.org
X-Gm-Message-State: APuU4Z/Dnvbi02ub/lY/A9xwSBynh0T69sVPV5JDUBJJyG+O7l9ARx+L
	g/tivWJiLqi1LXpECG6PHFei3zvHUFYcNOC7+kZ88c/1WQalY5FQCEQSZR36Ij27ZugyHclGg7J
	xmavdlRCJ9L7r2VEog+u6LILOwj+SrCzoeLgjuTbdv2e+5TjS0CZWS2dNwOIrzW9f2/yYQW6XrT
	q5uQ==
X-Gm-Gg: AYBFou0POu9mh2ejhECsjRxcxDQlDbLpnNOIJJ8Tgh4TO1tICWaLyR8jdXmV/qVZCmc
	EBHWm8ICP8rbSd/6cs11Lxe98TR0DyRYJKYu9wSYgUtnMAizzzr5L55DdEbBHBb5I+bzc0v7PoF
	t6zvUtAujiifCTUg+lkp99vyjcP/762ioJvses2RdJiwtkmO/FPCe5jK/bhSHcLiGWnj0K/QAVa
	vZseZ+vCaUlP5Mj8VNHU9kGQbuz7pI17qdlTBFzNrjoHVTBGr1VC+mfe5ZC6x+FpHjemMS639px
	+zwGXMpDeWW8jbGQ2CbJ7IwHam0bQQB+nHBRAcr/xjKSrjEGiflAYppx98qmKrRuB/+rkqGBeCI
	TK1/mWM4N5quXrEjp5mKxQ244sONDHoZ8uwgTnOTVg7pKo7YDtDpiC7g3CkK3O16rZ0sWVF4EKR
	n2B5kScTdq2SsX1LSxPk1vFWpdmiubFTU7ighk+pknNvA=
X-Received: by 2002:a05:6a00:1995:b0:884:831e:d0e3 with SMTP id d2e1a72fcca58-8beb63a2ad1mr6236118b3a.17.1794812128181;
        Sun, 15 Nov 2026 22:55:28 -0800 (PST)
X-Received: by 2002:a05:6a00:1995:b0:884:831e:d0e3 with SMTP id d2e1a72fcca58-8beb63a2ad1mr6236100b3a.17.1794812127686;
        Sun, 15 Nov 2026 22:55:27 -0800 (PST)
Received: from [10.133.33.59] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2829dcdsm3208979b3a.48.2026.11.15.22.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 22:55:27 -0800 (PST)
Message-ID: <c3da00ab-913b-48ee-8af1-eaef26548b4e@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:54:59 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 08/10] coresight: Add CORESIGHT_DEVID2 to
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
 <20261113024935.3173715-9-songwei.chai@oss.qualcomm.com>
 <9a479160-5bab-42f8-bf50-7b92c40b39c0@arm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <9a479160-5bab-42f8-bf50-7b92c40b39c0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: S6FznPUi9M9hI6WUpL7Zlt5j2Gr5G8cC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfXz357PF6SBcVm
 hi9aFySxSzT7QgWoi/Sn/X4PMm5PgGdQguiq+GwX4LPYIU+vVTMzEM21gzZe9WTU52m9YQ6goXv
 LTzrvET/CQmWAdoX8zso8PuTVWWc4y4WHoV3d+J6yJwxtmenfXxODbtp9IEGdBJn9uB9PnUQdy8
 +CiHhD2FXbKUBVPD6I/c+a3QIVU05iOcsPJOnLcXYEKnA73iWiLTfmUbmnZ1rwgQmdd6olJx+kz
 IVtCg/DJyrhw2YswVyQph3kbB4FrmVjD7fOknTK+OWcb13skGYgnw20u2PQQ/Y9//jP/O7XU5gD
 6s4oOQlAqXVG7UqXaVGglKO9TGwmj1MSjTZuTmDIk9/dqidtVow5Su+BfLmfDObKL16EEt0QT0E
 re/J2Gw7ZQgGXHUQ4PB/EHunxftewLanfEqikreKOFTHo7XWxLkFN/QcSkLxU+6p8/SP+fmVRFN
 Pm508zVE67+Ps6RPzvg==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6afaa8e1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RG7znLGuzyzmRdsVfVEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: S6FznPUi9M9hI6WUpL7Zlt5j2Gr5G8cC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfXyMq4D3yVUJOi
 o1tK4s3MrSWbslMVX7o9UW3VJGDETyrdVo8YVqV3dL0XBPzdu0cgu+uuWOAhWauRXjGwwEJgE51
 XDbphF+n2oxsfnTZMndHWgP0Vc9oJUc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_225530_234842_1970CFA7 
X-CRM114-Status: GOOD (  14.53  )
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


On 11/13/2026 6:27 PM, Suzuki K Poulose wrote:
> On 13/11/2026 02:49, Songwei Chai wrote:
>> CORESIGHT_DEVID2 lives at a fixed, architecturally-defined offset
>> (0xfc0) within the generic CoreSight management register block,
>> immediately preceding CORESIGHT_DEVID (0xfc8). Components outside
>> drivers/hwtracing/coresight/ that follow the same register convention
>> (e.g. the Qualcomm TGU, which uses it to detect its timer/counter
>> capabilities) need to read it too.
>>
>> Add it to the public include/linux/coresight.h so it can be shared
>> outside of drivers/hwtracing/coresight/, matching CORESIGHT_LAR and
>> CORESIGHT_DEVID already moved there.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   include/linux/coresight.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>> index 5286b3606581..7ce0366c7c70 100644
>> --- a/include/linux/coresight.h
>> +++ b/include/linux/coresight.h
>> @@ -37,6 +37,7 @@
>>   #define CORESIGHT_UNLOCK    0xc5acce55
>>   #define CORESIGHT_LAR        0xfb0
>>   #define CORESIGHT_DEVID        0xfc8
>> +#define CORESIGHT_DEVID2    0xfc0
>>     static inline void CS_LOCK(void __iomem *addr)
>>   {
>
>
> Merge it with Patch 1 please.
Moved Patch04 & Patch08 to Patch02
>
> Suzuki


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7B2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 14:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R20c9SDg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FqKn0cJX;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZNTbekvC;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AH339NCg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=U4yvW/bZFXVXxFQbUaDkeXJTatVe0Umzb3Tgo9Fy4/Y=; b=R20c9SDg6jpQ78
	ZUH+3nfqA79Fjw7eHbFm194H6wXOnyPBVft+PNpdbKEYwgMdVYN3QFjw2JNj0DPVlvsTDPe21T5+R
	Ehc7zI4ElE2yG5befzhFrqQgH9KZ7zJirziijjxWgyoUtwKZlsSgxMTjBXyst3ffMfxmy5euVmZE7
	UB/Cz01oqIwva+ZXar4cLGTwWnD+EetYMtoAr92goB6zq4F8Xyl51A2bCn/EKFk2TCNTreADuoprO
	3vYoDqn6/P3CYdEEevt2tyjkZQ1UXcmYs4Hv5KUQxGX8VvdKfktvFPYTJ36BlfCRJK/I52E+3zosg
	GXGuqO0Q0QQFJrZ5lLwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgGb-000000092Dk-2p0e;
	Wed, 18 Nov 2026 14:04:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgGa-000000092De-3X94
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 14:04:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=U4yvW/bZFXVXxFQbUaDkeXJTatVe0Umzb3Tgo9Fy4/Y=; b=FqKn0cJX56JqSb1jIoZUrmqHEO
	po8gmwXofubHfcbiIKLILK7+C03j565uuWQvu3O0fGGFME4snmnJ+FYVMaWzPUDxuRQxhg50JsQn6
	u3ILO4N6tFPoFI2dBEncFwVX8HjF4j9j0ZrTReuTOZhNOwE8QtFMttc65pxUalbgGvVdEYb03nXkD
	MutdNS4Sux0MS3XmpU0AUBP1MSTT+pBVnNHUlogUoh+NshHkTaeYvfKwJ8B1JYdk0j0HSB54y8leR
	qaXvSoFCEubUe7bJm5GseoVUHwrqJqsnYVA6XlZxmuj4DrKoLQwG/kmTcrathWcf0OnS+bkB4prvD
	X5Eaog2Q==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgGX-0000000G6jT-3IHk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 14:04:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDPv0x2892336
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 14:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U4yvW/bZFXVXxFQbUaDkeXJTatVe0Umzb3Tgo9Fy4/Y=; b=ZNTbekvCdAZRQWOO
	zU/KTAPc1uzOAY2LAk+B0Sd9kdxLzOSH2EPxIArWsBUTw/vU76jxIoyQ5W+8UUAP
	m+lXUduoESBfx2xMu9RSenQPLjR8OCMQcMzGzT3Gq7DtuMpKqPx2T6+osJvyBtfV
	iysTlSGSY/qN10QBKBLAgPJpGey1xC+cIBGY4kdKcJ1a6jWFKBPzU2s1MVab6K5o
	2PBxI3Vxxkv/K1nqKndEnXbWd4Rj5qy/bKg5v24lWsfs+Pveh0vsCJK8RILHWf9y
	kPewHEJOsGElfRO5WQ3/n1es3j2REFxDQgiEEljLIZU1iF3kQWCAxEJv9BQs2n7A
	RGfXhg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv93bf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 14:03:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so803657a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 06:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795010637; x=1795615437; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4yvW/bZFXVXxFQbUaDkeXJTatVe0Umzb3Tgo9Fy4/Y=;
        b=AH339NCg3jg5T+fL2tFf8Ij2mijs0BW9OxN0jVBNEcOqMVIiH4qUsyPeM+I226MW9k
         7UYjx96xU9e2sl9ouCvxJEi3fpmccjYQozJQDCgBgxWtfA1BkI0AAQueYC3r7Gr7fzWp
         DG12JcXDB/cs+dR4oXzelJuK1eZOKpox1un4l2zs+Cneywl2ZCIvQld6GQSCKyI86K1e
         +TT2RDQ/3pr/Tnj6gpmlvVoyhzOfpG/wVst93lXEvCxDKuaiLC47nfuQhjty4pVsuwCs
         vlY9n3//OTn2LcutIR80J79LkwWud8o2xp5CelmldG5FwYRU0rb4CSo6u0OMVSrx9uxp
         VGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010637; x=1795615437;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4yvW/bZFXVXxFQbUaDkeXJTatVe0Umzb3Tgo9Fy4/Y=;
        b=NWbb5PXKznIdIbb+W2iTLIZPQQfbcQlNvl9mwV1Wv6hljp6jvxKhLUfMYGWOXIHj+G
         QpswfcCToX1AJAeSikhLYErnOHq2eV5Lisu3F2AINjZo7sV2dF0rujP2MWkXBmeCvUL3
         pYQVsJEm/Dkq2BGscc7icV2o6KZtbIlFk0AOTswU7SP3qOAkKBOMj9IuOz99LzF8Ylgq
         1gtHLYz7a43NpyvE1i370RnpFqINJFU9Ta+eSngXgnl4a95F2v4o5EZVaX6DjVoP5RdS
         x2rHq2h96CB6FvCpbVetK0fDtG/a6eTAiOts3EscQicQ8jJLqUP84NVAAoCjpWbSg2A4
         U/9g==
X-Forwarded-Encrypted: i=1; AL+hErH61yZuV9VzhI1XE8SRAhErzpq9BiCYBolSvCKPicswKBSlj/7LGEcvcfx+/Ze7PMaX8JipaQfbu5IT9a8Bo1z9@lists.infradead.org
X-Gm-Message-State: APuU4Z9Wjs5/5Y1SFHc6Pq49N2LCtJstZqiGm4glUOQ6FB2V1Qpt4ZXb
	f1BshLpUZdFmWQi75L8zm9vBNf050gZypDxQTnBSq5nt+hLStqT6yHkK5jYp/FH/wZxSW3muqBe
	UKvfWkqRt8ubt8e9W03t5TL7nKT1FIZwcTm8++c7lf+5FHpWTsAhKO1kmoBCWN3mzOoCYizafw7
	uICw==
X-Gm-Gg: AZFdTZdZraTXb+CqO1E9BWnVmjAF+sL/cwyHD+GeXh2vTZtQx8nB9cwRB9yXPajp/To
	R+Ejlj/2sRM5xRljx2Qv/ZPEeRIGg58oCS2j6rBLX+ZgPKP92PowJT5y8rd8z3G+zDwvs2aR2o0
	QHRgEmEZJLD5Gzs+5Xmhe5F3bfHH4SOH8TiDmXuu4Tv+QWakNFktQZc4twpp5w1C4C2NfmYU0p1
	mea2nalhifsWQL8Rb3hMfD5vj2/hxx77VcMvIfIpD1Zl0gpL5VV3YmAjJH/QZmL6dNmEGlSYQ1t
	Sg37lCInnjbDWP2PgyUmBED68cxh7VvnNi93aYx4eBwzUpbKBZrWpTP1AIo9ma4N/Wh40s56vXy
	uAwesqKPqwmPj2VhZwswI8EnSo+Fp1xA1nU46vHkMIx6OtXW/z+F/u5CyLoH7OPNQJ42n0nhVHx
	mAiJLDDw==
X-Received: by 2002:a17:90b:4c92:b0:3b3:b71e:b2e7 with SMTP id 98e67ed59e1d1-3b3d0766880mr2786158a91.36.1795010636408;
        Wed, 18 Nov 2026 06:03:56 -0800 (PST)
X-Received: by 2002:a17:90b:4c92:b0:3b3:b71e:b2e7 with SMTP id 98e67ed59e1d1-3b3d0766880mr2786113a91.36.1795010635774;
        Wed, 18 Nov 2026 06:03:55 -0800 (PST)
Received: from [10.218.9.75] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff5ed13a2sm14908515ad.6.2026.11.18.06.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:03:55 -0800 (PST)
Message-ID: <7c67eec5-b382-4e58-bf3b-09df69752f5e@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 19:33:42 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v27 02/10] power: reset: reboot-mode: Add support for
 predefined reboot modes
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-2-fa4b3ff1359b@oss.qualcomm.com>
 <avo7dUvBvULHCOY1@venus>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <avo7dUvBvULHCOY1@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NSBTYWx0ZWRfX0M5ujcYrZhm+
 zBgIt3Xt2qy0SOYPSEirS1PJtPuYASAu8AztV4oVANB5b2Iy1zryUfl9crrCIZAvDcbDRggZ/E+
 P29GKMTjeRkouzdo4s6sFe1nvWMvW3Z2/u76l0jMXjd22107IiYUsGjDNEAps6goP3CvY4HPfQ7
 QSlzZdk0mrVlmXL0DhE07Gx33PSVhajAPeEQ06si3V2S2b+pGsV0B7t4Sz3rW+YKQRa9KxdNjd+
 pOIHoD4CsYkDIXamdTCAug4L3f+YPD2l9iEWWfLnycsvA8HC4mIdZFWpBXpfwQfNUP1CcncRqmU
 C1lGFFW7RsDNimNzRTxWS/Z9WQ0RqrFl7afiqJCmfRJwZ0MVTvJR5UoYGdM6GcKl/kpDqhzCFx4
 9Sac+FG4J5Qyni+MIKTRgBuHs64n6QcQNH1IRtvXIRscl+yiNPAIdXIa7YauM4p+paNAHQy86AM
 DLc3HH9Ta1abpWIWXCg==
X-Proofpoint-GUID: -sjKSWkhPOb_pOqE9fFM6NlSIViCIans
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NSBTYWx0ZWRfX9uQdmaKsWLjz
 JXR3bw+Mh05XBHc1W8Bpytd/bAV/8I9mhx9n8jg/yqruR0FOIE3WenCLKVtM/n+pmDSq8drSJeU
 s1VkxVPtnZ3CalDEZFGw21Ov1GmcI9g=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afdb04d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JKe0p63tuqD2XvbLR5EA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: -sjKSWkhPOb_pOqE9fFM6NlSIViCIans
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_140402_068247_56616D85 
X-CRM114-Status: GOOD (  27.14  )
X-Spam-Score: -0.9 (/)
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



On 11/16/2026 4:43 AM, Sebastian Reichel wrote:
> Hi,
> 
> On Thu, Oct 29, 2026 at 02:30:56PM +0530, Shivendra Pratap wrote:
>> reboot-mode based drivers can define a reboot-mode by adding it under
>> the reboot-mode node in device tree. This limits such drivers, to define
>> any predefined reboot-modes statically within the driver and creates a
>> dependency on device-tree.
>>
>> Extend the reboot-mode framework to support driver-defined predefined
>> reboot modes. Add a centralized initcall to initialize driver state
>> along with predefined modes.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/power/reset/nvmem-reboot-mode.c  |   7 +-
>>   drivers/power/reset/qcom-pon.c           |   7 +-
>>   drivers/power/reset/reboot-mode.c        | 192 ++++++++++++++++++++++---------
>>   drivers/power/reset/syscon-reboot-mode.c |   7 +-
>>   include/linux/reboot-mode.h              |  26 ++++-
>>   5 files changed, 175 insertions(+), 64 deletions(-)
>>
>> diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
>> index d260715fccf6..700732ed0f5b 100644
>> --- a/drivers/power/reset/nvmem-reboot-mode.c
>> +++ b/drivers/power/reset/nvmem-reboot-mode.c
>> @@ -51,8 +51,11 @@ static int nvmem_reboot_mode_probe(struct platform_device *pdev)
>>   	if (!nvmem_rbm)
>>   		return -ENOMEM;
>>   
>> -	nvmem_rbm->reboot.dev = &pdev->dev;
>> -	nvmem_rbm->reboot.write = nvmem_reboot_mode_write;
>> +	ret = reboot_mode_driver_init(&nvmem_rbm->reboot, &pdev->dev,
>> +				      nvmem_reboot_mode_write, NULL,
>> +				      NULL, 0);
>> +	if (ret)
>> +		return ret;
>>   
>>   	nvmem_rbm->cell = devm_nvmem_cell_get(&pdev->dev, "reboot-mode");
>>   	if (IS_ERR(nvmem_rbm->cell)) {
>> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
>> index cd7ba680b841..55aaa99d88b6 100644
>> --- a/drivers/power/reset/qcom-pon.c
>> +++ b/drivers/power/reset/qcom-pon.c
>> @@ -84,9 +84,12 @@ static int qcom_pon_probe(struct platform_device *pdev)
>>   	reason_shift = (long)of_device_get_match_data(&pdev->dev);
>>   
>>   	if (reason_shift != NO_REASON_SHIFT) {
>> -		pon->reboot_mode.dev = &pdev->dev;
>> +		error = reboot_mode_driver_init(&pon->reboot_mode, &pdev->dev,
>> +						qcom_pon_reboot_mode_write, NULL,
>> +						NULL, 0);
>> +		if (error)
>> +			return error;
>>   		pon->reason_shift = reason_shift;
>> -		pon->reboot_mode.write = qcom_pon_reboot_mode_write;
>>   		error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
>>   		if (error) {
>>   			dev_err(&pdev->dev, "can't register reboot mode\n");
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index 328fa37598df..fd61de226383 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
>> @@ -30,12 +30,12 @@ struct reboot_mode_sysfs_data {
>>   	struct list_head head;
>>   };
>>   
>> -static inline void reboot_mode_release_list(struct reboot_mode_sysfs_data *priv)
>> +static void reboot_mode_release_list(struct list_head *head)
>>   {
>>   	struct mode_info *info;
>>   	struct mode_info *next;
>>   
>> -	list_for_each_entry_safe(info, next, &priv->head, list) {
>> +	list_for_each_entry_safe(info, next, head, list) {
>>   		list_del(&info->list);
>>   		kfree_const(info->mode);
>>   		kfree(info);
>> @@ -119,6 +119,80 @@ static int reboot_mode_notify(struct notifier_block *this,
>>   	return NOTIFY_DONE;
>>   }
>>   
>> +/**
>> + * reboot_mode_driver_init - Initialize reboot-mode state
>> + * @reboot: reboot mode driver object to initialize
>> + * @dev: backing device
>> + * @write: write callback to program a single magic value
>> + * @write_array: write callback to program multiple magic values
>> + * @predefined_modes: optional predefined reboot-mode table
>> + * @predefined_mode_count: number of entries in @predefined_modes
>> + *
>> + * Exactly one write callback must be provided by the driver.
>> + *
>> + * This function must be called with a valid @dev before calling
>> + * reboot_mode_register().
>> + *
>> + * Returns: 0 on success or -EINVAL if callback/predefined mode configuration
>> + * is invalid.
>> + */
>> +int reboot_mode_driver_init(struct reboot_mode_driver *reboot,
>> +			    struct device *dev,
>> +			    int (*write)(struct reboot_mode_driver *reboot, unsigned int magic),
>> +			    int (*write_array)(struct reboot_mode_driver *reboot,
>> +					       const u32 *magic, u32 count),
>> +			    const struct reboot_mode_entry *predefined_modes,
>> +			    size_t predefined_mode_count)
>> +{
>> +	if (!reboot || !dev)
>> +		return -EINVAL;
>> +
>> +	if (!write == !write_array)
>> +		return -EINVAL;
>> +
>> +	memset(reboot, 0, sizeof(*reboot));
>> +	reboot->dev = dev;
>> +	reboot->write = write;
>> +	reboot->write_array = write_array;
>> +	reboot->predefined_modes = predefined_modes;
>> +	reboot->predefined_mode_count = predefined_mode_count;
>> +	INIT_LIST_HEAD(&reboot->head);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(reboot_mode_driver_init);
>> +
>> +static struct mode_info *reboot_mode_create_info(struct device *dev, const char *mode,
>> +						 const u32 *magic, int count)
>> +{
>> +	struct mode_info *info;
>> +
>> +	if (!mode || mode[0] == '\0') {
>> +		dev_err(dev, "invalid mode name\n");
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	info = kzalloc_obj(*info, GFP_KERNEL);
>> +	if (!info)
>> +		return ERR_PTR(-ENOMEM);
> 
> info = kzalloc_obj(*info);

sure, will update this in next post.

thanks,
Shivendra


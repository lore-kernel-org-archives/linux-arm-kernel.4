Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5519D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 18:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yUWIdNBg;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IpV8/bXk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TStF3xdk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=is1IjOBk13wV8pAnUUZXWALQm5FmYZmf98T0QXm6I/k=; b=yUWIdNBgL4+FPd
	Vb6GhjrZXt3FfHSxPPD8SC5juvF3mbR5+Y3lOKNU+2R8aTC7gDpB6+GXu+pq/EScaiQD40PiKOZ3p
	mfwv7z0i80efK1+IB4iKAoY/4qrd19cZxwvlThIQgGgOyq+WfFs3+N4jyF3r/KKup3DuaABcoPPA7
	pUCLHB0tgPa309dXAeRWy4UhqodOI0fGJsf4V4KOPsmQbqT5cI1tlGHfW8xUonm8C4+GSzIMu/c+v
	ArYFufBDkPxZdKU49Up26kxbZ1OKohR+sxw0dMP+pVK/UsFmrqh/wVFSXw3Mr2CsIHVpuqj86FJGs
	bF4IeqFo5PTnh0bb20qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZ9A-0000000Apvq-1QvB;
	Thu, 12 Nov 2026 18:03:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZ97-0000000Apuq-470x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 18:03:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZdVd1736685
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 18:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	is1IjOBk13wV8pAnUUZXWALQm5FmYZmf98T0QXm6I/k=; b=IpV8/bXkpYXuHKVf
	kdWRRPY9OgvhYkjJ9MVBevP/Md7oek15QRAzpgkKf6CHE1OCUKr19RE/4q+x532M
	2Ic/9mkFsJWPZIKBqrbIP0w8fv5tkqveh/hZIyy2EtfZsa4+9Oas4kRJB164knVa
	MhJ6VK1S576kZjFjLSxjcfYD3ot+JTaY8Ojpjdhne7Oy4qaTjBKwU203HqTpXH53
	W4jdkp0kMzDJXwkt4Z/w2XTg+WzfskLVhG96XXTA8+1HBP56Bz6aOgO8YDD9iZkG
	NEOBRQIBENPXEKUZ7+6EfvuhZFhGPuTuO/EWfq8vvOL35D+V+RDButzh2h6Kaxom
	d7TN9Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc2r8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 18:03:36 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99089f9591aso48349241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 10:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794506616; x=1795111416; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=is1IjOBk13wV8pAnUUZXWALQm5FmYZmf98T0QXm6I/k=;
        b=TStF3xdk1EejuR2vNogEqFtv9klQYbsWnxWZ9kL3p5e5YnECKINlkck3kqjxxEv0d7
         mfFdBSHhEqtcriS1mUOrjNqJTOtyMLpDkOQtwY1mlHQs94auuPaakHHckLVzzLkMcV2G
         cJ+e02F7RuJaRA29hah63YJ9V7IxyTvb1kmzFoXnGZU3F+s0JFLOHvZHd0TVVwqFFBAR
         t/JUi7IlgcEL5b5dec0CC7IgqJtCj1PCLiKYgK8QNsOudc8VDGmswdFZyePk2haOnuo6
         nTXimiZ4vGeiQmjNZloj9vRXSwdwsEBocAo8//PLERjTmx+8BciJ8UHKUyKpb5AaIhew
         vH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506616; x=1795111416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=is1IjOBk13wV8pAnUUZXWALQm5FmYZmf98T0QXm6I/k=;
        b=e0BNQxXOIsBrjpLfVi+F8zxC0C7vybE5dxcbbJgBHwUbVSwSbnRY5DSYTF2Ohx6jff
         c5d1ckaC1+6ynzRzuHmnJsby+CHIUsY4oahj/hKvcOCRq1SdOsG2ROFgcAzh1esNku0e
         CYQXRrebuZ4eX56uobqDvwTV7kCdGAlhZ81qD3GPklsgCqcV5taCC4l6JlH5nXmoySHb
         pRqiiwPH1BJEYjPNDMVDojJagwfPuhBRF5lP1rSH1CG9a7cjkwpRd/hwwI3SXqm1Kjhh
         qXcNW7C4UOg81aIqR/tpF0YrDkF6G4NkadNMy2IK3+qxz4c75JiOFsMqvsx/2+5pK138
         vhig==
X-Forwarded-Encrypted: i=1; AL+hErGkiyHLn8XXfrrjn+53ronE46Kg0MGTYO8AtoXt/ezxhyzOVG1ZHfXwDDlwGSmHwx8jsVxekjDhpfHNfxltT3tM@lists.infradead.org
X-Gm-Message-State: APuU4Z8Q8VSyo9r0MjYOuOAt24/Ff9EP0VOoDbTDU01FzkP2UYig7xVq
	3nqcIAKi8TRG4pSbZ9ieM6imm6AbBOxLaD7JYPMtsJb2tax7e9NvDXbYvdfZevc9IkKzGONi2qb
	HKA1n17KgrdNveGxD4E+YNUIdOAoFnZaYe5L+yjBHmjbIyaoHUqbLvtDijjPruc4hqjaf/gibNw
	+Hlg==
X-Gm-Gg: AYBFou0X75lAywSdha5t48HOemLDu84X2YAPhqv5NTn1jvX6qknICoPwiJ9+3CuGsR/
	XswA6tqq1JabIa5fSc7t+YuE6XMdrWSXnNMcoR1S0innYdVWl2Q53Y+Txdgm2Bhi7HID0INhnOE
	ewt1kmN9Jx1uyss4ahkjaOCTIJygb/n4wG/2CCvOPt5JsPeJeWU1YYNmYWTeEIvDnal/xv6/6ti
	cWw+3t/PBB3qlgMhGW6bseEbgVkXF8lsxrDea14b4qqNBGskaxm1xhIemFLen4QzCDu11cTmxgj
	BpXBW23S1Y0ERIoJZXjFi+3v442gVmrJBstHFk4BNcnE1nIYB2Tos/nyMYKEvKcKg7eDdma4yHP
	Jqt5dPdEI2/ZCPZoQzIN0S1pVzZfBzVT3XEqCeJwyDCnvXEVCmdXezN+Ssb8GiPG0ALIzyPXyEw
	xfmc4Is1GPVEyy+WYbSmpLoqNOhTiWWk2NZXw=
X-Received: by 2002:a05:6122:3d06:b0:5ec:3e18:a912 with SMTP id 71dfb90a1353d-5ee1c41a938mr2612962e0c.14.1794506615493;
        Thu, 12 Nov 2026 10:03:35 -0800 (PST)
X-Received: by 2002:a05:6122:3d06:b0:5ec:3e18:a912 with SMTP id 71dfb90a1353d-5ee1c41a938mr2612929e0c.14.1794506614860;
        Thu, 12 Nov 2026 10:03:34 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2acf81sm80058415e9.14.2026.11.12.10.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:03:32 -0800 (PST)
Message-ID: <d30df23c-c1f4-4a7d-a56d-33c1f9e1a6f7@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 19:03:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] smpboot: Allow restricting per-CPU threads to a CPU
 mask
To: Thomas Gleixner <tglx@kernel.org>, akpm@linux-foundation.org,
        rafael@kernel.org, peterz@infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>,
        "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
        "open list:CPU HOTPLUG" <linux-kernel@vger.kernel.org>
References: <cover.1793660202.git.daniel.lezcano@oss.qualcomm.com>
 <af37c4e7811a86adafb2064e7cf4aa4f5090ab4b.1793660202.git.daniel.lezcano@oss.qualcomm.com>
 <87zeverlrs.ffs@fw13>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <87zeverlrs.ffs@fw13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SwspPpg1FVnwm4iazQ13IDR6oEByp3wO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3MSBTYWx0ZWRfX+vy7s3s2o7rB
 MUyGphlIIPyHm7iLIN02p0H3OPJ9qPbfE6OMtJaO4s7P1q73Pa110x9Qfrwuz/nnqzO0+fOkYnP
 VsPV2GkdEsxvCreUx3/j6sA93CSqi0U=
X-Proofpoint-GUID: SwspPpg1FVnwm4iazQ13IDR6oEByp3wO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3MSBTYWx0ZWRfXwcZ7f2XkVgUv
 qrpHI1Gq6a0WNnf5EMgVsAL1zwz387UK2XHB0PshDG/97a83akNZe5C1PbuScJroq90EzR03G46
 ECTB0vw1Yjf+4G2yW7Lyq0BGJPqAwlCSKrvwmjlxS+s4dgaLNVvtwVOmWXnME1dI41CLG4q/TQb
 IjFRc5F8oYNFt7/BvWoN8oWUfUu5Ug3Y+DZLDvQCgQNawI53ITwPIPu2hizaunR6xi2tu/b+d9R
 W89X9xnVbHiC8qhmLYhf4NBnTXBI8I+yqNI6pzL/fpWXrpnBCPqZSSxEDn/3a53FFz1kyJ2j4pb
 5Lzkc49BSW9qtQ+LDsdSrH0CbHYcZ4X1my3VwcXx1U14pLGomgr0CjAwUyLI/+Zq+q0yqUICqG9
 PINlCUCGHwglbzflLJBJqRumweAgP3lnsRZy6XJqqDJ/woipVLTHYNQVtj4KIAwX5ZDOKi5eSu8
 iWmo9Xt3Gsw9Z6nZWHw==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af5ff78 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=A-cxFYNZenKyrZAO6n4A:9
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_100338_038091_7F2D8659 
X-CRM114-Status: GOOD (  17.42  )
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


Hi Thomas,

thanks for reviewing the patch

On 11/12/26 18:40, Thomas Gleixner wrote:
> On Tue, Nov 03 2026 at 00:09, Daniel Lezcano wrote:
>> smpboot_register_percpu_thread() creates a thread for every online CPU
>> and registers the descriptor for subsequent CPU hotplug operations.
>> There is currently no way to restrict these threads to a subset of
>> CPUs, even when the user only needs work performed on that subset.
>>
>> For example, an idle injection device targets a specific CPU mask.
>> Creating threads outside that mask consumes resources unnecessarily.
>> Supporting multiple such devices also requires each descriptor to
>> manage only the threads associated with its own CPUs.
>>
>> Add an optional CPU mask to struct smp_hotplug_thread and apply it
>> throughout the thread lifecycle. Registration creates threads only for
>> online CPUs in the mask. CPU bring-up creates threads for selected
>> CPUs that were offline at registration, while parking and unparking
>> are restricted to the same mask.
>>
>> Apply the restriction to thread destruction as well, both during
>> unregistration and registration failure cleanup. This is necessary
>> when descriptors with disjoint masks share the same per-CPU task
>> storage: tearing down one descriptor must not stop or clear threads
>> owned by another descriptor.
>>
>> The caller must keep the mask valid and unchanged until the descriptor
>> is unregistered. Callers sharing per-CPU task storage must ensure their
>> masks do not overlap and serialize ownership changes themselves.
> 
> This really wants a built-in check which prevents overlapping
> registrations for the same thread storage. It's easy enough to do:
> 
> smpboot_register_percpu_thread()
> 
> 	if (!pt->cpumask)
> 		pt->cpu_mask = cpu_possible_mask;
> 
> 	guard(cpus_read_lock)();
>          guard(mutex)(&smpboot_threads_lock);
>          list_for_each_entry(ht, &hotplug_threads, list) {
> 		if (ht->store != pt->store)
>                  	continue;
>                  if (WARN_ON_ONCE(cpumask_intersects(ht->cpumask, pt->cpumask)))
>                  	return -EBUSY;
>          }
>                  
> Hmm?
Yes, I agree it will prevent strange things happening

Thanks for the suggestion

   -- Daniel


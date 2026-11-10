Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B4560A260E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 01:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RDmIba3k;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oEZKlxit;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FUbhgOmh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Rs64S9EZ5xre0uSyH+TcgmPL2yJaa6bDvpQYSfLsy+I=; b=RDmIba3kgtyd3/
	p4I5BZSgmSLxI5spXWXLsOYMATaYKuPki0/thsMswc4Z+ANQRJCS33+WMgsUTnxdl8gqITB7JRXwd
	gZP91DScwj3jSZHOq1h5+mWB3dKshwnxnWvePt7NvVXhPQQa43o+Ymd3lU+1w50Wk72DszHciIdU2
	UtMy069VbuqSDBVG9suCPm3DEyFxrDpb/qFcFy07bHT84lChBPdGVqBoQFH9zs3YjewwrexxjM+n9
	f1Oi0BJzsvk4guKiSMoTKXtDsSzefYDAm+CjqU51nqR5B/vBy392SV2lj1K9XuyJJadWJdIDGQnSX
	rsXKFKRLPTNp89QUdI+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaaa-000000024bP-3eDk;
	Tue, 10 Nov 2026 01:23:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaaW-000000024Zu-0Pa7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 01:23:54 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0is9X1850012
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rs64S9EZ5xre0uSyH+TcgmPL2yJaa6bDvpQYSfLsy+I=; b=oEZKlxitht0U08BJ
	PYs53sHPoZlY1z4NuVgVKUWuIs/F8uZSDQazzU8pmtaVdIwLqlZ+TBO9MN3Ai2Y8
	nr6AecaVSCAFJHBThw/SA3ql9ARBiYGQK1OBAyJJm4pnC/pk4P8E8F3lFQeoa6Vq
	gSgw645b+mZXqFEpqdSjvnOJHWhk7lwnTnyqhOC30jBK6FsL4Ww/e2NaXXjiN/Fg
	NCEVJ+bqbQNfNpoOTSqYe8yZknt9IRyUKyhaUEiJCpn7uaVHUEIdT2aMwueGi7Z7
	BQNZMW32xflCD+ojeTJlmbdHmQKhgodYQhMWBfW8M8dcA6GeLOjLmZhsabkmlS5x
	ohvsWg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5txux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:23:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0f667a666so2230417a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 17:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794273831; x=1794878631; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rs64S9EZ5xre0uSyH+TcgmPL2yJaa6bDvpQYSfLsy+I=;
        b=FUbhgOmh2yCdyarOdaPO+Cya3WCB1HWjGMHwniLn43JhITbasMSRuQDMuvuSJrQQao
         sF0CZ0TDbMXHJxLNoihWyrAJXMWr1QdfDnzRR5k6qrVZrGpDYaAXindHMoIuLJRzNO40
         AlOtoHCTtEtjqeLYDOc2t8VEuQbUdW1xJxi9Gg+Ifdrn65jznA88HGSxc8B6y81sfjO5
         O9xV1tmI08JdV8CndsFLvuyIlB71BS/b8fENrygipD6QuMk/FXZ2XPjG2OL8mHGdzFxa
         rm8xUsR1sRWu3apr5aVx8ni/1FOwUrzUbvXvY6ccKPvZez3SHAr7KPfdg0t0MGoaGRL/
         Y5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273831; x=1794878631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rs64S9EZ5xre0uSyH+TcgmPL2yJaa6bDvpQYSfLsy+I=;
        b=Yl0psK5rEdCDbqGpdVpmgtCD4tD40KHeg7euCP77zYHCu9tE7zaSNJBEDr2tlSEGvU
         6ZJVbmJ7OKVSj+OjCvNRyEfWon2kZVy7S+6jJqi3C1kxlZzxv5bYjlvwNbRmOc4hXGuX
         N3PfZkZk4Ug9AfzB3aBAS0xSCMmo0G0LWCC0rmWfWGamc9y54cCDSdi4vsQ0zj8dFqqy
         BiUpIXIuVOe0gg90n+3dZoSD8nTm0oDqAEWHfAK9jGe5lLtRUGo2imGWIIItiAJz+J/F
         kXrRQORNuAwMQFBcG6oXDbKOmxmNY+1N/VeB9xgL7qQm5ryn4y8gtZ5GhfAYYVOIbX2A
         SzeQ==
X-Forwarded-Encrypted: i=1; AL+hErGnd0bkwOwz0Jhc07hqWLUJfivJKCdVN/Ve3VWUIw4G4BSnF510mFxNACeLh4YZnJr2VyvtIhJxzeULo0eH0tJa@lists.infradead.org
X-Gm-Message-State: APuU4Z+hZgxwxxIyX/IvgiKDwn97H6JK2imfmSgxzm/nFL1fD3wH69eA
	4U26ph3deA2icgSoWZTvazwuFdivoYJOFFwW9r8+1Ppobc6Y4+EzkxtyCrIcrELyyDpsAbXFCtZ
	UvGhDZUZykIv25kzdhXGSQ3j17L6BNNI8l0grevj24NbaIAqsLg+nbJIRtlUbOA6bjWtOrtVRr6
	3y3Ukr4XSoBB8r
X-Gm-Gg: AYBFou2eOMqzSQzEUtMXzukW4ZR5zYSiQhICOSQ+8UQAaqVNGfpfu875T3hryuEiM1c
	Km3bbUx4iEpGfRbhHvBDrRO/JUkOGR/ls8pDHQC+QJDRIBNJKhzHwVNmIA3dMpaqI+SNvRX0BXC
	DByqP5AP+gVp2oZBPEbGe6v+uJeDSI6EqdViqT5aGipmmoLBpdWWPeNGq/ajErKFZ7PgXf52Six
	lZiHCgTdUC1AyGBlu4fO+OSgCPESnw9qXzS9vhJgwmEgNUsuED0pIqY0xQMS4/Ky6udoAw6bd/x
	1tzEfXmD8E0rEJ1unF1ydnjfwRurgDqw8WfEJ1iuFI3Eq0QFxSVVCVIqnR0zCGyOCXL4GCJ8ky4
	TIYwxPfYKtRKE/f5BYfiosabicX3SE8yxJISDISUKqffhHF1kBREkk4bV/vxwZJ9FQhDFHegsHy
	TTl5a4/tzo7qaqjjVrLHZTPj6DAQ==
X-Received: by 2002:a17:90b:2810:b0:3b1:2810:dfd6 with SMTP id 98e67ed59e1d1-3b16700e47bmr1354251a91.64.1794273830814;
        Mon, 09 Nov 2026 17:23:50 -0800 (PST)
X-Received: by 2002:a17:90b:2810:b0:3b1:2810:dfd6 with SMTP id 98e67ed59e1d1-3b16700e47bmr1354228a91.64.1794273830289;
        Mon, 09 Nov 2026 17:23:50 -0800 (PST)
Received: from [10.133.33.198] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1676db5b8sm1599108a91.8.2026.11.09.17.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:23:49 -0800 (PST)
Message-ID: <3a734370-6961-45da-9af2-0a5fffb1ee9f@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:23:45 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix resource leaks on path build failure
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Mike Leach <mike.leach@arm.com>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260513-fix-memory-leak-issue-v1-1-49822d7bc7d4@oss.qualcomm.com>
 <51a86fe7-95b8-4f49-96bc-2245c334b7f6@oss.qualcomm.com>
 <6f6f69b2-6005-4574-972d-efe80b8a8b5a@linaro.org>
 <a7a484d0-9458-4051-aad0-983341dfb0e6@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <a7a484d0-9458-4051-aad0-983341dfb0e6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfXwCxos1CdlBU8
 2ehFcbZ2sR5C2nGhOfpHFmNEiQWjIEhaRU9TNgBPgftn1UnrXE05LUQZt/Rcf84aLEnb0RvYlF6
 VCARLCk8hIFWF5tPe5a/ZYGmbUnHW5k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX+sRWTzSfR+LC
 1RP4BzTSFcs+pPlVWJy3K15hJ9Z4TP851tYl5/P4dJNGagf3aHK3RpQL6O52Xt6Z1UVJkmdolcA
 KJAoiuBHIqQWyx+y37vo0+Kus+DIrIUh7boqVgiKB8rSkKaWf/jJTPmhzSD6hGQ3aOS+bIps48h
 ELy7Fs6Yot+mXVX3zFx1zTRh1/qt+QNPNTFQh0p/aep6vgdqkeyIa9H7ESyT7Gy3n/t4PBhIOFc
 WzKWlJYyR6Yyn5xVo0ioczgs2bnBD2GS6YROYy0KMGyU2f9eJaW1wLy3rXBm31LgLrId78jVwdj
 cpC6nvR1JCMUrs/jDlciPkwMWO9iNREH33kkYQhapHL9XZg2OF6pYXrI7RhVfmYgj1hORkYvByU
 bY2QSBoQBBtD+14wLIahfZVOP72mhOtFswnf55dgQG6kDW/l3qPfX7rygu/3qUyB0MsiKZb6zOp
 yfLba5ITpa9xLLofBwg==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af27227 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=R4kogEE5nOyr4cp69VAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 40T4P0V3FW_kFCYnQORwZK3NEuiuLUzt
X-Proofpoint-GUID: 40T4P0V3FW_kFCYnQORwZK3NEuiuLUzt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_172353_081046_4D575CDC 
X-CRM114-Status: GOOD (  19.19  )
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



On 11/9/2026 7:46 PM, Suzuki K Poulose wrote:
> On 09/11/2026 10:34, James Clark wrote:
>>
>>
>> On 09/11/2026 01:24, Jie Gan wrote:
>>>
>>>
>>> On 5/13/2026 9:32 AM, Jie Gan wrote:
>>>> Two related leaks when _coresight_build_path() encounters an error 
>>>> after
>>>> coresight_grab_device() has already incremented the pm_runtime, module,
>>>> and device references for a node:
>>>>
>>>> 1. In _coresight_build_path(), if kzalloc_obj() for the path node fails
>>>>     after coresight_grab_device() succeeds, coresight_drop_device() was
>>>>     never called, permanently leaking all three references.
>>>>
>>>> 2. In coresight_build_path(), on failure the partial path was freed 
>>>> with
>>>>     kfree(path) instead of coresight_release_path(path).  kfree() only
>>>>     frees the coresight_path struct itself; it does not iterate 
>>>> path_list
>>>>     to call coresight_drop_device() and kfree() for each coresight_node
>>>>     already added by deeper recursive calls, leaking both the 
>>>> pm_runtime,
>>>>     module, and device references and the node memory for every element
>>>>     on the partial path.
>>>>
>>>> Fix both by adding coresight_drop_device() in the OOM unwind of
>>>> _coresight_build_path(), and replacing kfree(path) with
>>>> coresight_release_path(path) in coresight_build_path().
>>>>
>>>> Fixes: 32b0707a4182 ("coresight: Add try_get_module() in 
>>>> coresight_grab_device()")
>>>> Fixes: b3e94405941e ("coresight: associating path with session 
>>>> rather than tracer")
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>
>>> Gentle ping.
>>>
>>>> ---
>>>>   drivers/hwtracing/coresight/coresight-core.c | 6 ++++--
>>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>>>> hwtracing/coresight/coresight-core.c
>>>> index 46f247f73cf6..c1354ea8e11d 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-core.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>>>> @@ -825,8 +825,10 @@ static int _coresight_build_path(struct 
>>>> coresight_device *csdev,
>>>>           return ret;
>>>>       node = kzalloc_obj(struct coresight_node);
>>>> -    if (!node)
>>>> +    if (!node) {
>>>> +        coresight_drop_device(csdev);
>>>>           return -ENOMEM;
>>>> +    }
>>>>       node->csdev = csdev;
>>>>       list_add(&node->link, &path->path_list);
>>>> @@ -851,7 +853,7 @@ struct coresight_path 
>>>> *coresight_build_path(struct coresight_device *source,
>>>>       rc = _coresight_build_path(source, source, sink, path);
>>>>       if (rc) {
>>>> -        kfree(path);
>>>> +        coresight_release_path(path);
>>
>> @Suzuki, there's a conflict here. This will need to be 
>> coresight_release_path_locked() if we also take "coresight: etm-perf: 
>> Serialize AUX topology access" from my Sashiko fixes.
> 
> The changes needed by the patch are already what your patches does.
> Apologies Jie Gan, I have merged Jamess series which solves everything.
> So, we can ignore this one.

Got it. Glad to hear the issue to be fixed.

Thanks,
Jie

> 
> Cheers
> Suzuki
> 



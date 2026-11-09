Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B249D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 02:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vObFlWp/;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV4VxcvZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rc6Z3HUe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gIsILu38RSpIB/VQtAXT+jlGCK+QgBbfByzV7rqh7Do=; b=vObFlWp/yo4W4e
	kdB9AaDf/W+Pic+jxIEMBD8d3KI5oXQnx95YK/YTeYxggVZtbQ89tWsp55UgbjWH77YWNtuXkrPeq
	CXtIJFatZ6RgXq8QSkXHhlaa/oqEVpxUy7fSQpZWRa83tXYShmYEXQPYzio7iiseQGpJaSJXKqxtj
	ouACLXzLKLnNIq3H9rVTu+0YYAxEu4jafqj71AVTnB82j5/FWfOhX2CJeAGGDkGxzad3EblKRdtRV
	FWkxQfOzCWOtSjJC3p6RgxOO67jVXULxaAORIa1WF0OZnTMAn5MqxKbcfJtuBmaZkkED4YKVh792t
	aF6wHSmc/3hKq7Eepsbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEoP-0000000H6Xs-1tMF;
	Mon, 09 Nov 2026 02:08:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEoN-0000000H6Wz-09Wd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 02:08:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90H9Pu3850182
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 02:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gIsILu38RSpIB/VQtAXT+jlGCK+QgBbfByzV7rqh7Do=; b=PV4VxcvZEc/NHdbF
	Oe6LhKn5icnqW5+Pd29eXIRMoHDKJgo7vqPhqzCjBKoamE1IyHesxWtw8WJUy4A7
	nZj0prCqfgPFPYjAqVJ6n+xedd9+mcLSUMNV4r3kBHJB6X4d62lKmLufjT/yU5X4
	E9ITpZu7Cbrle+Cb4OQ79RGZWppKr3/1mEu1YTjiXNhAaqSyReX+uvnbyrhXyNxZ
	XO965UFxP+TVR1AuYo/LaWFzh70zJxUDmEXSYJhD1uX4xfEcSPgGnPcNOMSa66To
	M1R1ED9Eo5NJjhQ1hu8aZHYF3/5+Ghw4ERO4WDr4nTxUHFLdQt3352KUDeT2+Njc
	/KuFVw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf4kg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 02:08:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so331152a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 18:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794190121; x=1794794921; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gIsILu38RSpIB/VQtAXT+jlGCK+QgBbfByzV7rqh7Do=;
        b=Rc6Z3HUeGGu6mXFL89uJ86B4qFS2VrnPBLWYfGshODtfNKN/di6teL7CYxd0XUatw8
         2IhA+j122ZmwQP13HZWG+SQYbiQb5ua/02UXUWg1CePa2SQXYW0Q0LjEdnHcoevC1b1u
         uTCUESIBZC/YjZssOyLZrF2xs15VDS+VR8HaFtKQ/QzL3xYJwJ3/SBe9QLGyRH7+hd14
         x+thtHuOQ8f2JgMitxucmJaaa8PXuswWLsFpBzH3d3NVahfnFgon2w1jkmak3IuO04/I
         2hu7aXf3Ik6baXMTraCh/51eloWP0FiugydCLIKIYNxfQ6iW6bzO3PTVWll69RUSpSzO
         F55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794190121; x=1794794921;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gIsILu38RSpIB/VQtAXT+jlGCK+QgBbfByzV7rqh7Do=;
        b=YuqtdrESVWux3n0mLAh58XJ4/Ly4n5jCgZ8WAPHjrGIjqL7/pbWcqLvOQPKfDZUxEE
         W6E/uVWKHzBO+Kgmcf0wVuK7YlD40tFkpKpaboQUF/r1y2fO4l66ptZos9e3aHo++rjC
         Q8g1oIc73Hpi6c9jG+RkQldinBF/EHtThm4CDBAbo5n7QPZ5SqBj4mv3na6SsgqnFjay
         4ZjudJFI7LxdQmj02p3TYlUr34pI/kSwtEv7J6iIpMQdP0WzBOamC0DS506p2QjdCTpr
         HHvThzhsWOIvobpKoQIcAGME4jVq2EKLmOGLu+6P7B3+5MyPbpHcFnXZ9oLLXvYzsCCj
         Dcmg==
X-Forwarded-Encrypted: i=1; AL+hErHHxv4xAhocj/1sQQpqbsCVK7ksZiRlFIxDFYen26ozJ3QOYon6wFTmIFMwp5e1fnoVIS7wqUbASghr7GHjSYMt@lists.infradead.org
X-Gm-Message-State: APuU4Z+mp0ZG6MASktHD0Kp7BCWUfFQ8QJLlOta7OBxQ978+jJ8qBM+y
	GsMsPN731LvRfnWskLY6GQa3j8x01R6JebITjMtOi25l4V4xfx2bcgVSmwm69hNxhElx/w6gWvl
	1S/eCkXDtV6qHUWQtHPJLVEjQG42fO/OnrXep8rn38sCiAG9uEDAb6FuvYelLvyfDqIrvddzuAS
	DlgA==
X-Gm-Gg: AYBFou0RVNtbaL61cJZHlkkINhpd033pIiVIjw2kWYXOiYbcm0bJUeCuQ+wFRrP8JwK
	t4w9WzgR0SIb0NoTs5FlWhWx/onK2hfTe4cMT8Pdn+p3qGGiiLu5atm84a2kmdvYkQPaXb2vEGN
	nTXksbtmJhSdZGvA/WuGzo9W9Sox7k4WNomyWhMAqvX9j5i8j0lpZu+o7TCllSrabg2mDaqkrnn
	4OAUy4zAJnd48Av0pdxOjrg8IY0FrCRHHeJP+9UyO0d8c4MpWNA1DUCqZCp2xXdFN7qyvI/ATU1
	1jKyrAqiqFbyGUs3Xluip9czcnb1DIwzmATm7QtyE5UuxJ7eP/TfZ9bpuDuPHEYscOa4vDs0Bac
	a6qcVtTfrxtjHfaWH+pJDE35mYwcaAG4pvNnsFYZeoPJmdYExd4mKTJuJ1zqG5XW3aqXrReFRsq
	8yNw9FXwu8znEmH+1lE73J8mU0MW2WP5RTS/Ayph5THCK+
X-Received: by 2002:a17:90b:4c84:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b12d373624mr2158718a91.34.1794190120338;
        Sun, 08 Nov 2026 18:08:40 -0800 (PST)
X-Received: by 2002:a17:90b:4c84:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b12d373624mr2158678a91.34.1794190119715;
        Sun, 08 Nov 2026 18:08:39 -0800 (PST)
Received: from [10.133.33.170] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1278918f4sm4779025a91.6.2026.11.08.18.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 18:08:38 -0800 (PST)
Message-ID: <5df6771c-a440-45cb-bdb9-ca25b42287fa@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:08:35 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] driver core: Demote "Fixed dependency cycle(s)"
 message to debug level
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        songchai@qti.qualcomm.com, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, Saravana Kannan <saravanak@kernel.org>
References: <20261106084034.1579494-1-songwei.chai@oss.qualcomm.com>
 <au2UzljzfMaiL7F6@hovoldconsulting.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <au2UzljzfMaiL7F6@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwOCBTYWx0ZWRfX5zhnANr5xLyD
 vQS3okWOC4iGbFgI5Oy6j0aQ6S+J3htotPd0Hq5CsVOZl6yBxzORPAo4FYD45Eama37HBylBF9Z
 o9DqA8QFaPMUV9Q+amBxo1ZsBo3p0MQ=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af12b29 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=wpr1R3xn-rj-rwNLJSoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-GUID: 1ewLqLLJ2J1cfL0k61p8M-MV-3UWHSLn
X-Proofpoint-ORIG-GUID: 1ewLqLLJ2J1cfL0k61p8M-MV-3UWHSLn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwOCBTYWx0ZWRfXyKUovyStIJIw
 kwVD5mFgEN+gd9XsB7P8lBGDay9B8viJi0CjucSJMDCeM8DcvRgVF6KuAixmHcGqWhTiXtZhqfd
 kvQEIRhibmH1LrdDCqiiRMZGiOB+XXYsGld90aoSJse0RCXDVhKK2QAMwCt4vfqmrvMRraEi0BY
 S7h5EMXS1SwOZEGRC+iYgiae+VWVLl8pFfCLx0m44qdSi/KpX8LoxUPvbTvT32RQPcoZx1DiUnj
 pEWbqSP88p2lVL2nDgzy3Z2/JKgfbndLUVuYIakM3hoWA9NOcdPEde8i0y/qV3EgrfoAvXart1E
 MLcCrooDke397zDxDmuWiW3Z4U6DOSaE4Za+tyc9gOVdg2MlDPfPK7fRSGzZFxdaOziJyMmiFt0
 9t0fm6EwYilqfIwtCn5ZiVCoMhAfnlVAfgufPfzWKW1lBZDL5F7Zt8wWWINvwgwkhvLkag7zSVv
 uKbi+dbeNMWVitw+iAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_180843_079222_D27ADFCA 
X-CRM114-Status: GOOD (  15.80  )
X-Spam-Score: -1.6 (-)
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


On 11/6/2026 4:50 PM, Johan Hovold wrote:
> [ +CC: Saravana ]
>
> On Fri, Nov 06, 2026 at 04:40:34PM +0800, Songwei Chai wrote:
>> fw_devlink detects and relaxes dependency cycles automatically, so this
>> is not an error condition requiring user action. On complex DT
>> topologies (e.g. CoreSight), this message can fire for many node
>> pairs and adds noise to the boot log, even though it's primarily
>> useful for debugging. Switch pr_info() to pr_debug() so it stays
>> available via dynamic debug when actually needed, without cluttering
>> default boot logs.
>>
>> For example, on sm8750 this produces 125 such lines in the boot log in
>> total, 80 of which are CoreSight-related, e.g.:
>>
>> [    0.057190] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/stm@10002000
>> [    0.057211] /soc@0/stm@10002000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
>> [    0.057229] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
>> [    0.057249] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
>> [    0.057254] /soc@0/tpdm@1000f000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
>> [    0.057260] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/tpdm@1000f000
> I reported this elsewhere a while back:
>
> 	https://lore.kernel.org/all/Z6t45aOGDkotqM4Z@hovoldconsulting.com/
>
> Are you sure it's not the coresight bindings that should be fixed?

No, Johan, I don't think this is a Coresight bindings issue.

This is the mechanical result of the standard bidirectional graph 
binding + fw_devlink's direction-agnostic phandle scan — it will appear 
on any SoC/CoreSight topology using the standard binding, and there's no 
alternative binding syntax that avoids it.

>
> Johan


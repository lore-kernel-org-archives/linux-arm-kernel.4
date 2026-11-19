Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1236E606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 01:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HI0fcsqe;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAQptyjb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=auQ1Hd9k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7XvTGUwPVodqg3oYiFhJa0NDKJXoq7wCuqsi0qvn+yg=; b=HI0fcsqemZhakN
	q2pwunH+UkkW5Aju/BstP3L019GIDFOMuZ2LTyyMKDbi/NqUw/8br6N74DT6N97llm/09oUW+jwhi
	zFzGMDFzl94OaENqXCUlyHBbqLa3TK44IdyhfQBGFHGHGrhjIaQW1PbzWlTiC651nKSDFMf6uIyAF
	NpwJIS6zBrbZLP1p6//sdfLqV7aglkKVD2ozLlh7IKXXqhhxQittiY7UabvCa2gZTCyPirCX9T4ex
	392PbQQH7/7cpueJkvJmJCZIxLYrFmpMAT5VUYn4Hd+ixRfLX6rbz8CE9IqsFDk9QzGWp8bSbXDiB
	I/PimVtj/lbOSJB3g5kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTrES-0000000AeQ8-3Q1L;
	Thu, 19 Nov 2026 01:46:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTrEQ-0000000AePc-04Bs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 01:46:35 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1B8Yi3490669
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 01:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7XvTGUwPVodqg3oYiFhJa0NDKJXoq7wCuqsi0qvn+yg=; b=DAQptyjbXlcZ2Lua
	5EhbMDcjLkCA2fsm6XAujVwBoxvyQAs80IcQto7rIcEGb0/j1nxH0mTepFJjt0so
	B3Xs0cp4IutTY583ALBRDu3lTFmBKdm0mPY10TUYIdp7CscdCz8ERQyJxXLQyMAI
	OBEOfaqMyUDDKM7Z6jYe+ARElgkP2iSQVz8yt1mQh9iOV5zSKnr6Z1z0Syiivqgv
	xmghJLlMBh+81GU8iUIwYCFXgNHwNU6d7pf6wx+fDF5i295EAvekXiNGiii/dFjl
	iAQWeab550uevTcnq+M4mzatITJf+Wtv8A75lPPNHgignUj3qiGB+oLqoc31yWW5
	7SmQXg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3ba1bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 01:46:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eb5375cd68so16796385ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 17:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795052791; x=1795657591; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7XvTGUwPVodqg3oYiFhJa0NDKJXoq7wCuqsi0qvn+yg=;
        b=auQ1Hd9k3vCpgxIUBCuX90ucShmCJb+wW+xY3B4bxPXAN6dpP1aLZ8FZ1QkSidXoHQ
         VxxM6BI+n7gmbjwa8rZYGL9+irwSHjQ+UpsJU4PN7rwcMKqYqiF9Kkxg7KRuCHcGRW90
         TSytOdY7H/Mo2CPl1iqdXxm87MXyhZ3UxEV0J0rJFGGVjlbu9vusmpp9H5FTUxscUGe5
         2HSF1mexCQbI1GIVhuEvR4hEBMQv8tQjUBRWcoGWQrtgXed27DtZI2VEjFoaENRMNyWS
         4qBtP2mI7X5xfKzq4602enlEFg1fjD3yJyuF8ZUwC5f+Ntzu4lYvfk6MSV1z4E5vjdHO
         RlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052791; x=1795657591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XvTGUwPVodqg3oYiFhJa0NDKJXoq7wCuqsi0qvn+yg=;
        b=Q8OPdhFPwyfLq1X5BevaIp4XmM2OilPcDZ85RtZ0kzXYNftlc6/09nITStk4k+EPEv
         R+0Msmj0feY12zKiq2ZNGbf37Dm8oY02FcjPq2xZ9C1IwPSezgP7VldtmOnYnlBDfpZT
         6YtoYaCXqN5cRl1YV2LVttX3O6rP4Do4rgjcdA9ULAJk2PRGb3GJ1W5sJjTjv8eU/Ydo
         fkYRSXFtUet7/a0y/yVnvoN6zUsjLTvmpC9XccfcMsj7ULVy5GUyMA/sDmNnsnMJJA45
         hDPNTomAuueLoGGyIiAV+NQULK8r5rnH23j5nltNwzHaZx4hwZnoq9EHbE2oOkZ4YDHt
         jJqw==
X-Forwarded-Encrypted: i=1; AL+hErFD6jhSugOUrNkWCGleGlk9vDTC84NXjbZoh+dtIW+xYCmnqJ8953TC0vFhnO5bNPAw8wWUd8SZqDJTVIFZYdNN@lists.infradead.org
X-Gm-Message-State: APuU4Z8UcIRUxVG0FJNa2kKnwnLyfF93yAEu7oW6A4by8BOz2GRrFp6N
	Yc+8AWA4zAFswaLJplkcgInhylnO3I7tyXSX+1puUzxmAd33ZX/+u9YbeGFSPzCcXuWRfsO4Lu3
	uggE1bMsYedRtEBOaf0/huUyZeFFry662e07zKaq7V8CpfmkXahMQifEOJnGsIjc5EhCk1Bec8E
	//ng==
X-Gm-Gg: AZFdTZcAo98fVsbQwxLLeWHsLhbf9rSEM9XwRhaF59hnCedAjwineYLURMFrFrpc7v2
	WU6TNcSBGkW5//vnMfbNnrGSXsnwuJK6GusUO7t8aANyOIcHgBSJs3o4K+iuqNKmkTlD9n5QOMS
	xfDFSvht6Q8k62CK9dDR8xxRkSvWgRI8ADy4375md483MaUWL8Rgnb6cDgnCKiUtMaDox4eSt8O
	3AxsoJtVqbkGIO/vRd7y9XQPkxBnRGryJGtLx2PT0LF+SxqQEMGCv/TBSkaeFnr9guoWybuO/m7
	QslZQ1JK77EkJNrC33vtKxIn6JtHXVPQ7vlUO7kv16NoeoWJwiVWoDBVYpV8wbY4SOMJfehe2mk
	+Vc9cC+kM46IxQUlznS4KcPQ553p3l9fBLZ76QndWwoAcyJmmO403OR3YMOiyXdtaZMc2Xg8Qgr
	xUZbyfoILGhAtSkM4WApiA8xYTlNsNz98sG7SHXg==
X-Received: by 2002:a17:90b:3c05:b0:3ac:a11a:7c7f with SMTP id 98e67ed59e1d1-3b3d07b8f81mr4086192a91.23.1795052790912;
        Wed, 18 Nov 2026 17:46:30 -0800 (PST)
X-Received: by 2002:a17:90b:3c05:b0:3ac:a11a:7c7f with SMTP id 98e67ed59e1d1-3b3d07b8f81mr4086159a91.23.1795052790366;
        Wed, 18 Nov 2026 17:46:30 -0800 (PST)
Received: from [10.133.33.89] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe08cf1bsm745570a91.5.2026.11.18.17.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:46:29 -0800 (PST)
Message-ID: <ad300534-54a0-49f1-bda9-3d781e3d730d@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 09:46:22 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
 <20261118-enable-byte-cntr-for-ctcu-v23-2-67fd9db6bc0e@oss.qualcomm.com>
 <3348a751-87df-4f22-80e0-8467c6b263f9@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <3348a751-87df-4f22-80e0-8467c6b263f9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JXKZjcDQtwub82kaLQvN6F6XTSe55ZkI
X-Proofpoint-GUID: JXKZjcDQtwub82kaLQvN6F6XTSe55ZkI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAwNiBTYWx0ZWRfX/Bj2kmRbmP57
 gOsrvG0xpWo5Otc2mvM+j1M6KE+8erkp6pTvIr5XWnNAIYs8xfKXB0JLUkuhXYXZfUfO+UDjCbq
 wxihf61eKwsblrIi6E1d6MV1UHJSi8M=
X-Authority-Analysis: v=2.4 cv=dZQVTnXe c=1 sm=1 tr=0 ts=6afe54f8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=rvWznffgM_U_UKBysmgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAwNiBTYWx0ZWRfX1kyoJqNVhvgg
 iyVEKDkMDyqh4SOH4aaoIeCngYWocy+7NppzdoMd/w5nJox1NsFIHgD2UEX8r7iBycofp7G2jGs
 ih3P3JlTCCRk5LTb4A+eDNxyVisqBX/WS9SzY6SqqtOiP48a/sOYOkmy1ub16Ctda/WhrZgXCpX
 H7QkUw8yYBZQo7+xGt1CzwkNPuF1J85r6KDEDpqHKSP7FDlu1SqqZPaxTPVIyYqP9M8SAmMmnl8
 Lu6vWt4+CJqIz32GA8av1yT3H2/tpoV7PA881TvRCrrGtJvaW4AkiaZBusoAnJbVZn4BgOhjCm1
 byd1Nmlb5OPetYepLm4p8hzcz1+ACc7eCr5bw0wtID0OQcsIXN4aRUZYiOkJxc37sOpFekNvsV1
 GrX/XZu0w3kL8Pa0NhzT9lzEQ5AHWcts/8uJ3rAJU2yQS5zs/NnkpK4tzBviDkrk7YM/Jo18AVm
 540RP4ZnotmvhKcP+yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_174634_202227_25BEBE73 
X-CRM114-Status: GOOD (  41.92  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/18/2026 7:16 PM, Suzuki K Poulose wrote:
> On 18/11/2026 08:02, Jie Gan wrote:
>> Introduce functions for creating and inserting or removing the
>> etr_buf_node to/from the etr_buf_list.
>>
>> The byte-cntr functionality requires two etr_buf to receive trace data.
>> The active etr_buf collects the trace data from source device, while the
>> byte-cntr reading function accesses the deactivated etr_buf after is
>> has been filled and synced, transferring data to the userspace.

[...]

>> +     * We expect that sysfs_buf in drvdata has already been allocated.
>> +     * Wrap the live sysfs_buf into the first node so the captured trace
>> +     * data is preserved. Take the sysfs_buf and add the node under the
>> +     * lock, so that the ETR sink enable path sees a non-empty list and
>> +     * doesn't replace the buffer.
>> +     */
>> +    new_node = kzalloc_obj(*new_node, GFP_KERNEL);
>> +    if (!new_node)
>> +        return -ENOMEM;
> 
> Since we know we need num_node entries at max, could we not allocate 
> them in oneshot (kcalloc()) and free the unused ones at the end ?

I hadn't considered it from this way before. It's a good solution for 
allocating the required buffers while simplifying the code and making 
the locking easier to handle correctly.

> 
>> +
>> +    raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>> +    /* The sysfs_buf is in use by a sysfs read session */
>> +    if (drvdata->reading) {
> 
>> +        raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>> +        kfree(new_node);
>> +        return -EBUSY;
> 
> This pattern is repeating quite a lot, do you think this can be a single
> exit from the function for such cases, something like goto err_unlock;
> 

That would be better.

>> +    }
>> +
>> +    /*
>> +     * The sink enable path reuses or frees the sysfs_buf of a sink 
>> which
>> +     * isn't enabled, so only wrap it while the sink is enabled in 
>> sysfs mode.
>> +     */
>> +    if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS) {
>> +        raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>> +        kfree(new_node);
>> +        return -EINVAL;
> 
> 2
> 
>> +    }
>> +
>> +    if (drvdata->sysfs_buf) {
>> +        /* The mode may have been changed since the sink was enabled */
>> +        if (drvdata->sysfs_buf->mode == ETR_MODE_RESRV) {
>> +            raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>> +            kfree(new_node);
>> +            return -EINVAL;
> 
> 3
> 
>> +        }
>> +
>> +        live_buf = drvdata->sysfs_buf;
>> +        /* Keep the buffers of the list in the size of the live one */
>> +        size = live_buf->size;
>> +        new_node->sysfs_buf = live_buf;
>> +        new_node->is_free = false;
>> +        list_add(&new_node->link, &drvdata->etr_buf_list);
>> +        new_node = NULL;
>> +        i++;
>> +    }
>> +    raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>> +    /* Free the node if there is no live sysfs_buf to wrap */
>> +    kfree(new_node);
>> +
>> +    while (i < num_nodes) {
>> +        new_node = kzalloc_obj(*new_node, GFP_KERNEL);
>> +        if (!new_node) {
>> +            ret = -ENOMEM;
>> +            break;
>> +        }
>> +
>> +        /* Allocate the buffer with the lock released */
>> +        sysfs_buf = tmc_alloc_etr_buf(drvdata, size, 0, 
>> cpu_to_node(0), NULL);
>> +        if (IS_ERR(sysfs_buf)) {
>> +            kfree(new_node);
>> +            ret = PTR_ERR(sysfs_buf);
>> +            break;
>> +        }
>> +
>> +        /* The buffer mode may have been changed to the reserved mode */
>> +        if (sysfs_buf->mode == ETR_MODE_RESRV) {
>> +            tmc_etr_free_sysfs_buf(sysfs_buf);
>> +            kfree(new_node);
>> +            ret = -EINVAL;
>> +            break;
>> +        }
>> +
>> +        new_node->sysfs_buf = sysfs_buf;
>> +        /*
>> +         * The drvdata->sysfs_buf write and the list update need the
>> +         * spinlock, to serialise against the ETR sink enable/disable
>> +         * paths.
>> +         */
>> +        raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>> +        /* We don't have an available sysfs_buf in drvdata, set one 
>> up */
>> +        if (!drvdata->sysfs_buf) {
>> +            drvdata->sysfs_buf = sysfs_buf;
>> +            new_node->is_free = false;
> 
> Is this supposed to be done in enable ?

Yes, picking the node during enable and marking it as free makes the 
logic much easier to understand.

> 
>> +        } else {
>> +            new_node->is_free = true;
>> +        }
>> +        list_add_tail(&new_node->link, &drvdata->etr_buf_list);
>> +        raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> 
> Instead of adding every node as we go, could we maintain a local list 
> and add that to the the etr_buf_list at the end of all the allocations
> and when we are sure that things are still sane to do ?
> Set all new_node->free = true and when we get to add the local list
> set the sys_buf with the first entry and mark it false.
> 

I will try this solution.

>> +        i++;
>> +    }
>> +
>> +    /*
>> +     * Clean the list if there is an error, but keep the live 
>> sysfs_buf even
>> +     * if the sink was disabled meanwhile, as it holds the captured 
>> trace data.
>> +     */
>> +    if (ret)
>> +        __tmc_clean_etr_buf_list(drvdata, live_buf);
>> +
>> +    return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
>> +
>>   int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>>   {
>>       int ret = 0;
>> @@ -1928,7 +2128,8 @@ int tmc_read_prepare_etr(struct tmc_drvdata 
>> *drvdata)
>>           return -EINVAL;
>>       raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>> -    if (drvdata->reading) {
>> +    /* The sysfs_buf is owned by the etr_buf_list */
>> +    if (drvdata->reading || !list_empty(&drvdata->etr_buf_list)) {
>>           ret = -EBUSY;
>>           goto out;
>>       }
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/ 
>> hwtracing/coresight/coresight-tmc.h
>> index 319a354ede9f..7c604b9f92e5 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -208,6 +208,20 @@ struct tmc_resrv_buf {
>>       s64        len;
>>   };
>> +/**
>> + * struct etr_buf_node - node of the etr_buf_list
>> + * @sysfs_buf:    Allocated sysfs_buf.
>> + * @is_free:    Indicates whether the buffer is free to choose.
> 
> super minor nit: Does this mean the buffer is available for tracing ?
> Simply "free" is good enough. Or choose inverted logic "live" or "busy"
> 

free is enough. I will update it.

Thanks,
Jie

> Suzuki
>  



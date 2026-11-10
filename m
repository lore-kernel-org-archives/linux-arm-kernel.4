Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8E5606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fHFR7D48;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kK4GUUP0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/YXMIySPA+wMoi8Tkma/U6Fd0RxKKSji2GuT/eWsNBU=; b=fHFR7D48XIXlQd
	RklsSafAo8mECMGTSV2LGg5Oeh7gZNJRzS9z9Yi1jYETXSZ5GcwRemAzY8SwEmxvcTFN5A3pEqGN4
	XCqhE/3OFG0/k/MRABphWNDUjah0K7x1bNjo4ZExcwIAM2RMBTrlzmktFp7zW5q1wSUCB4SyZJnMi
	6vKjXfnAmvpcp5dLIf0D19CsJJ9oT4lEuBWP5qf/nFXwxcvngd1BD6KveyKJJ5npW+924oeXz3vHV
	+p1rWXErJixwjesEEbxbkkLRDlCy5QXUjvWVqYceZA73J58MQT7R9kqdQwWNRvZQyyfHVisi6lxSB
	SZQOnAUobYf5OmOtQ8Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnr5-00000004OiJ-0fCs;
	Tue, 10 Nov 2026 15:33:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnr2-00000004Ogz-1tWT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:33:49 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso23321935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324826; x=1794929626; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/YXMIySPA+wMoi8Tkma/U6Fd0RxKKSji2GuT/eWsNBU=;
        b=kK4GUUP04aSIioWL9aa5cRxj2a5BxBza1M844ukvZOHSmSzsYh0y/vix/xfTZrksvk
         zN2oHSs0hRqOTdQEGC/+RNv/QfKreWr8W53SM4xEFCXi1BbTAg3mcJvMfWnmsyNwyGDz
         fvEUO0e64c6fwvw5bLpTBjMzyORj1Xf8nik3qw0sD5d7Z0M94rI19dOhSjLxi8ZAZIQf
         h9T2MKZMWsVmNIpi97NpWw+nYJFOKZSrvbMI0JL249z6Yi3VpQuFCyYm6+KyEuAus+2H
         50tzHlHlNjNy0o9PbZCo7S5mmfQnThRN8E4dVrlCV8gm+M67VpoVn2LRrpDEBfOj3+TQ
         PEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324826; x=1794929626;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/YXMIySPA+wMoi8Tkma/U6Fd0RxKKSji2GuT/eWsNBU=;
        b=vlVKJfNlV9FTJEEsGvaaisR9RmTQmqjSXjuKJEi7AON6Mj2MAFlAl9EDY6ufE+WuGt
         ++W630AEFrNxWPsBNCzyRS/UZrXB/SUzzeIuXEvEj7e/00OijAovRW/na3zhW4UOsNwy
         baVDHtE9aJ1CH5wKoKH/cIzEBxr6OunmMd/X0XmbGu8XAM+JIhy/P0ZuArsj+e0x9cq/
         4xD7wm9i1bNAzKM1njwe0eeLT/E5qaMXqJgfD9+GvjAOoHxwH+fTtt4RfsCZ1gaaNCjX
         hDiDr5xTPH1WrGAMS4X5898FJtf94w1NTelZMwh3sPP9q9B4588ttkJpMaS7MppsmMzu
         19WA==
X-Gm-Message-State: APuU4Z9IFyEBqjvJBCQbpkxR6fFEZaCOA0oZUFl2vAfAEW4YzWzyXN8E
	oJOrJC3mbCG/cSq3RlnePqtTxH0x2ds6pfA3NzJ8pnUds5dSa4sTmsZLk1M4aq+PxmQ=
X-Gm-Gg: AYBFou20fEezkSZkVyKLQf54qaAVeOmMykJWrra4Ujehi7GZNbQwdpFE/yNcXooD4j9
	Fid7P9pw0P2462IeO+mPvDkTss6uxwBtd2DXmae+/Srtpigr5QEaf7lC0Ft/82/pOXtUhgg5a13
	8AGpAh9YjHdmwKGC+PI/hylN8pt45W6+zlieBuqSRPERthOZDzwm9m7i9SPKvVWTeBPgKH2rH5s
	Bhe4034LjA1Ed56vrBI02YEFo3PJ5WZ31Wg/z7bOUbw0Wq787MgrmKv75H6u/KyfCpwB1i/p2xL
	7wgsSVK/nabYkAF0YnnE2jjZHZrExyssZRJ/Zy/99jfHJmjQYs/zYYbSH83qczenzC01S3Dm7Hv
	JR7HLaF4rKbCKtP588KME8ETA9a8boeIDcNPtJmCXMzyU7+QyypSfzjLJjAAHWdjaHC1jprOZ9Q
	6LIvt84GffgyCgpvJgr5nrJ8SdPgQEu5Veez/yHWs5RgquseOiDvWAgXrpkCxOe992fe5PE1oqg
	VKTomVKOuoGrmY8qfmaIL5z9xIKKqPrJSfuFmxUHLnDe8k1GJQB2gX1QMkCLvzhKGLq5LJfzE7/
	wf9upSnBsdU4GvAnt8mYMIurabi6TRT9QZqxr4OKG7IYRyS11/phrq4=
X-Received: by 2002:a05:600c:4e45:b0:4b8:d17e:da27 with SMTP id 5b1f17b1804b1-4ba0235055bmr57644325e9.27.1794324826414;
        Tue, 10 Nov 2026 07:33:46 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm81073115e9.9.2026.11.10.07.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:33:46 -0800 (PST)
Message-ID: <0d2e3f78-eb15-41e3-b847-0524003bc5e9@linaro.org>
Date: Tue, 10 Nov 2026 15:33:45 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/23] coresight: trbe: Report truncated trace on
 buffer update errors
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-15-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-15-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_073348_514346_FAD5CBD9 
X-CRM114-Status: GOOD (  16.72  )
X-Spam-Score: -2.1 (--)
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



On 16/10/2026 17:55, Leo Yan wrote:
> When arm_trbe_update_buffer() handles a pending interrupt that is
> not a wrap event, it discards the buffer by returning zero. The AUX
> output is not marked as truncated, so userspace is not informed of
> the lost trace.
> 
> Set PERF_AUX_FLAG_TRUNCATED before returning zero so perf reports
> the trace loss when closing the AUX output.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 1c585b6123df2f20d08747678d836742ce9564cc..ac49098aa08412a23a20d32f84c2e1977ee4a223 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -903,6 +903,7 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>   		 * errors and as such buffer is empty.
>   		 */
>   		if (act != TRBE_FAULT_ACT_WRAP) {
> +			perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
>   			size = 0;
>   			goto done;
>   		}
> 

Reviewed-by: James Clark <james.clark@linaro.org>


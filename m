Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1A0606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 10:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JRRqDvEc;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A6WOF9om
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r83k1cNkUhctdhSteH8YPD8rm/QpmvN7geVl+a5ebSw=; b=JRRqDvEcT6EwyR
	Il0LOsRDWtlMHsnuQJRH5QaxOllFNmSbM3ZOTZkTx5TSIvZbCYERIVgZuwRlStB39wqMVMNpdo6JP
	bb5uZvY8lBuBLKOk4sQEEKMH82nQ6UYomWehJo+Nozxq5cSJnV0IuqVZ5ez2lii3QzTZ5HEQOYGWb
	QVvxzfpcCSxeZ454ftjXUg4HgZUiLRwSs1rb0Mnxe/voPsgfFKvSc4GtA+GcMTWOx2PpkEC1iQ0g0
	bPy1aWqtr0ampOhl4WYmLz3hmEXShgVk6qMzr3k4tnWjR/CGjbyUV9TMRph1CpwcEuPbVx9kivO0F
	2Pl4opYQIIEC50iC3aBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMlz-00000000R65-3uiU;
	Mon, 09 Nov 2026 10:38:47 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMlx-00000000R5P-1SZ0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 10:38:46 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso442087f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 02:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794220723; x=1794825523; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r83k1cNkUhctdhSteH8YPD8rm/QpmvN7geVl+a5ebSw=;
        b=A6WOF9omnk3mFulnXZUIEbbGycNABTSlFFWz+4fyFgb3KLnlTxe+2970lNij9hfyW0
         G9scDvXMTO38sTHFHBUfHSIqZyPLNZKanOvdc/BTa9IWPbB3oRzK5UkIzuxqxx0X144I
         ty66l/Oe2EdoRRkS45R0lCPPWxXnhdaaC8KOyiWOxGpRRQ/oCghUx4bec8SasJ2c5zCT
         heC6bIU0X9GiAM1KLw0siYZUoBzqhLw9wCe78SzfETvp/3oN3MnouQKn7r76ndcwjnLZ
         ZGgt3VFb798S/ZG0qNcM8S/5kziI0BsAyerIgvooF47I/gLw5BfHw/YcTi5xysJmr7Jm
         K+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794220723; x=1794825523;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r83k1cNkUhctdhSteH8YPD8rm/QpmvN7geVl+a5ebSw=;
        b=r6oPBCx2nOpbbJ7A+EM+LaG8RoVm/K9s0xdfhIRpdpfS+eUFHKghlggq6x5V9KSej8
         XPAjO5oAeAMOH/DlFBWO+I5KH9WmjncH6rX261uORo53ijiH0L8ZM5h4jL8PD8blLYLR
         PRet4CLxgC/ttmV4a/fnBaQTFvdVFTUYTdj5/SExQsPcEqghS3VUGUJ8VUg7ud3op5Hj
         gtsgmuSUproxJrNAIa406LDpgQuFp5/VgtRDduR9Vnw+k7Pkjzcv7kPTYDYlEyso5SQ7
         2Zf7xx5gpXzgZWSlHrcbVjUg9fbN7Bo09udVXc+3CBK35xjgdrou7oiWnxGM3KwNuWVQ
         hWag==
X-Forwarded-Encrypted: i=1; AL+hErEM9JkM1iDQ7/bfIGJDQl0z73QdZqVAY+a0rpDjE+nMfvOwK1kACQm/FQm3H/jTFeFHqE3LQFgWKTaIgQvFTvnh@lists.infradead.org
X-Gm-Message-State: APuU4Z+JN1bAxPBxYwlhqNhwnOXTFZdDD95o3pDiBVD5o7C0kkVjxzKF
	HJb9gKzEVefFOj6sIz/O/k7I3/6p7w3/t1DQpQnEsv+lvn/pyiaQyyUlWJtFeJizt2M=
X-Gm-Gg: AYBFou03ZgNeUqGjvBBYh6sw2Q4kNek5vO3QUqjb2QoRFuJrmlkoEKZUP/pEYTwDNlQ
	j14rOCfEg9rTl58KDndfdi96iX1ipxJyfVKbacjwAorqwwrrTpkW9XHq2tsrMPAbjRiqj1vDVFo
	mOaTsBIGk9MXCnxJ12ZMCqJNRbABYW5ZL2QVS6zfTCgSV41tNIyH+Yo0Ma0qio1F8bquP7PHcAg
	x23Bxdvy5OWi5aRv9/mxxk/QCtEP/Tkr42JM8x4c/U3vmggCs2s244aGPZ7JMkWKPIjjEzwVx+y
	Ilt70+SP/4PuII2qHo+laGwKfGD/z1GerO/uP4UTVBQ9b/mx5TebV09QYsTgOtOFsY4YKoz0PJn
	CaaYqwpHMnc6vTUkek5v24D+Xlj+xLThuTsMfzevKDOp+9PaFpoq7I6dWUr3T/PLKEU+mx02EgG
	7pjP9tAmEvx0k1ZhMc0deMpTJB/ebQr+6ILeeT9vLONiHB/JfpbLCGaunljlYDx8SWYMMC7SR42
	ycQnLmwysbPNvZ91fb61LTQASK34ljpWVxmXOd7vithkcJN2KzrxWYf6JlY25YIVNobYdtFAeTH
	qsXost2T7HZYryfcT5CBu4ikJK1Hla+z
X-Received: by 2002:a5d:5f47:0:b0:48e:6669:fefb with SMTP id ffacd0b85a97d-4958b62ee80mr7635031f8f.22.1794220723287;
        Mon, 09 Nov 2026 02:38:43 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596ea5008sm9181122f8f.26.2026.11.09.02.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:38:42 -0800 (PST)
Message-ID: <3e75a65e-0dab-4c7c-8d2d-264c31ecd985@linaro.org>
Date: Mon, 9 Nov 2026 10:38:42 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] coresight: funnel: inport schedule by priority can
 not take work
To: Chao Xu <xuchao066@163.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, mike.leach@arm.com,
 leo.yan@arm.com, alexander.shishkin@linux.intel.com
References: <20261027151457.5713-1-xuchao066@163.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261027151457.5713-1-xuchao066@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_023845_434805_BBABE31E 
X-CRM114-Status: GOOD (  15.25  )
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



On 27/10/2026 15:14, Chao Xu wrote:
> The CoreSight SoC-600 TRM, section 10.11.2, PRIORITYCONTROL, a funnel
> rejects priority register writes whenever any port is enabled. The
> current sequence therefore prevent the configured priorities from
> taking effect. Write the priority register before enabling the
> first port.
> 
> Signed-off-by: Chao Xu <xuchao066@163.com>
> ---
>   drivers/hwtracing/coresight/coresight-funnel.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 0abc11f0690c..500ff72a83c8 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -62,13 +62,15 @@ static int dynamic_funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
>   		rc = coresight_claim_device_unlocked(csdev);
>   		if (rc)
>   			goto done;
> +
> +		/* Update priorities while all ports are disabled */
> +		writel_relaxed(drvdata->priority, drvdata->base + FUNNEL_PRICTL);
>   	}
>   
>   	functl &= ~FUNNEL_HOLDTIME_MASK;
>   	functl |= FUNNEL_HOLDTIME;
>   	functl |= (1 << port);
>   	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);
> -	writel_relaxed(drvdata->priority, drvdata->base + FUNNEL_PRICTL);
>   done:
>   	CS_LOCK(drvdata->base);
>   	return rc;

Reviewed-by: James Clark <james.clark@linaro.org>



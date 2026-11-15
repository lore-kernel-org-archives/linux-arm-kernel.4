Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF62606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 22:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2HGFLhoD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K9R8w8kd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dCpJ51ujggena/DY0lnMQOWhNgzWqSe96IeE3HGzQzc=; b=2HGFLhoDp1XiDa5Ug9p6O+dRHA
	uz4uaVmpTsUbDUSUC4TO2IS+eHXQS6qiOk8ZyYlDEEJcB/fwYkwbvLq5A3VlZqV+rvDJ4ST/9rCeD
	sganaYWDx28l67FAwN6/jLQmVH1/IXICMWMKFmz+fYtxFdOEPyy+bRE5WRbeA56K/fP2dC1A8jGbz
	hoMffm6GhXuim0kw/9ddrlTmUsNIvjsCpeDyjTBPGfP/x7Za6NWqPq8cgv40rDkSTAozw5VG4j3n4
	XXv+ddZ0Cge+22uiCSkpfdl1eQYytV9Zvm+D28uSM9L4okOmfVopWkq1KsNCtJSy9H2ikfEDHcqxi
	hyQXuwbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSipz-00000000fkg-0Vy8;
	Sun, 15 Nov 2026 22:36:39 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSipw-00000000fjv-2vjs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 22:36:38 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cddc250d815so974877a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 14:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794782196; x=1795386996; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCpJ51ujggena/DY0lnMQOWhNgzWqSe96IeE3HGzQzc=;
        b=K9R8w8kdrV8EKTkB/LaIKInJz6GnSXRQjbV2HdFNwfEsdUGO/MYuz2w5b03fhgbneY
         YoY+Ld3ByzjIYxEDVPoWxe4tBhMeL1pizRYt1/ezRVV56GbqCz5HyjB6uoXwz/aZ7Zpi
         thiuSKGRPffHUYOK37qaIziW8ebxRezQTNzN2cyNkUpJJA71xBoya8XuRC6SlSmh9Ax+
         e0ApGxq1Nv/bQQh3Gr/M+5HDQEfLeNEde+bCnIeWs06uDWcEDCG7S7lFdKSF/UqdU+v3
         3GHiOwCI4J1s9iKVxXkmLJg/v7UaYexnn2hHC0cqXrudl32Nu8VZQRl8GNuHbVoNCmXD
         bNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794782196; x=1795386996;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCpJ51ujggena/DY0lnMQOWhNgzWqSe96IeE3HGzQzc=;
        b=UbWgbjRu4PSBhmDTXX9putIj9tF/AK7Xupcj8mUF40WsYnOg3v2gO+EvBlRuMFqByN
         UhlSBCiSAx1si617I01nMLpc48U9kjkgW+zF+3sZrXZLEmtXMO/OTVFKD5wkp8B/TL1s
         R5+lBJVOBKc+Qemjh93SrLMz7YYHVDkIIwX+r38fPPF/XW45fD4JtqeJLRiGtXOvg1Eo
         kvjqJUmb+ez8N2hGeYftT7C9OlSMEXQCkjWlFLTfx2NYf7XNSG/QN56QKWxupTk/RKPV
         nBDTc2/e8nfDojfnPtfUELETYe7mk1TUuM8QZVA9lbbQLoefiCRh1O7USNfA+wbBqxol
         Q5ZQ==
X-Forwarded-Encrypted: i=1; AL+hErFZtEaQ7h6+5Ym0mqnv8a5JcJJIXt8PHoQd5ABS+lJvMqU6hbTfCZfrBB1Z5mQqNr2o9mQkrshhloCwJGrqyDm7@lists.infradead.org
X-Gm-Message-State: APuU4Z8fnak2KqCVDv2+cPCMXWKXuP+o5Q3NGYP/YXvRCMKUVCwEOd+h
	/j0ja7nDKWU+GD1QHxuiPX8zFFxqZvhSvioYxH+QiFZPkNWxrQkrPR+/
X-Gm-Gg: AYBFou3iEEIXHs4GiFl1P9z9MvmzLrSz5ssIrBgzJJutVhMQgPsSTCH0Ey9DXVtFr45
	Utn0F72r6sEXzpii2BI2JcESf1nMCKKDnYAAylAkykyP+jS8Hp6Fq0Z+jcJ/xZ63k26NdDEFh5k
	z9m0UZ6mFv9lgYYumNcCmQqJDFQcgG2uX3grBToQ2dauRas7C2Ae9MrGVCZRkmDMlPywxOqPTby
	LFFwiJXxGMHANEE9A7z1nIqFuJeHW+FTe2ac0blTmG3e54vBOzvAh4vjwkrfO0MdsHOhqZeGKAe
	n17evGf7PiJlXhJOcpfqgQ8d8gmJIlQ+9z+uNCAc7r5qkazb5aynyH3CM9zC52N0iScpzRKwQBg
	0Nz74Ucf6Ut/ufL7wITcqkXc55ND68c9mWwI+Xatrg6LNYRYojZVPCCjDgsYdmYcgQLaFAIF/pB
	vquEVBvTekdI0tp/qOCRIysU66r5VOxNIVaE80ZkMxmBtKVUn4oLNAAJ14JKeS3tZv0HCSLUjh6
	/V+cwcJ/iAz/ktcjR2qwVzVhLlFYmRqiSrlG8I8O5LX/uFzPtpY/1glqwqHUWQYvckYQJ8vKAj8
	eKK+ImDJcqRm15nW6JmHWNqo7dnKKN+5VRsIKgv1kv+I3vmeyY3wPfEWvd9VhtWvmob2
X-Received: by 2002:a17:90b:5150:b0:3b0:91ce:6726 with SMTP id 98e67ed59e1d1-3b1b0a42b97mr8059264a91.21.1794782195677;
        Sun, 15 Nov 2026 14:36:35 -0800 (PST)
Received: from [192.168.35.214] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm18891520a91.8.2026.11.15.14.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 14:36:34 -0800 (PST)
Message-ID: <4794724e-456e-4efc-b5e7-536c8afad0fd@gmail.com>
Date: Mon, 16 Nov 2026 07:36:30 +0900
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] devfreq: Factor out devfreq_set_governor()
Content-Language: ko
To: Jie Zhan <zhanjie9@hisilicon.com>, cw00.choi@samsung.com,
 myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linuxarm@huawei.com, tianyaxiong@kylinos.cn, zhenglifeng1@huawei.com,
 zhangpengjie2@huawei.com, lihuisong@huawei.com, prime.zeng@hisilicon.com
References: <20260729102348.3857779-1-zhanjie9@hisilicon.com>
 <20260729102348.3857779-4-zhanjie9@hisilicon.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20260729102348.3857779-4-zhanjie9@hisilicon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_143636_748270_DBD8A047 
X-CRM114-Status: GOOD (  33.24  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: chanwoo@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 7/29/2026 7:23 PM, Jie Zhan wrote:
> governor_store() and devfreq_add_device() contain similar logic for setting
> a governor when devfreq->governor is NULL.  Merge this into a common
> function, devfreq_set_governor(), to reduce code duplication and unify the
> entry of setting governors.
> 
> This also prepares for further changes that get / put a module refcount of
> the active governor and prevent the governor module from being unloaded
> while it's in use.
> 
> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
> ---
>  drivers/devfreq/devfreq.c | 128 ++++++++++++++++++++------------------
>  1 file changed, 67 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
> index 53c40d795a13..959f0b08ed36 100644
> --- a/drivers/devfreq/devfreq.c
> +++ b/drivers/devfreq/devfreq.c
> @@ -318,6 +318,70 @@ static struct devfreq_governor *try_then_request_governor(const char *name)
>  	return governor;
>  }
>  
> +static int devfreq_set_governor(struct devfreq *df,
> +				const struct devfreq_governor *new_gov)
> +{
> +	const struct devfreq_governor *old_gov;
> +	struct device *dev;
> +	int ret;
> +
> +	lockdep_assert_held(&devfreq_list_lock);
> +
> +	old_gov = df->governor;
> +	dev = &df->dev;
> +
> +	if (old_gov) {
> +		if (old_gov == new_gov)
> +			return 0;
> +
> +		if (IS_SUPPORTED_FLAG(old_gov->flags, IMMUTABLE) ||
> +		    IS_SUPPORTED_FLAG(new_gov->flags, IMMUTABLE))
> +			return -EINVAL;
> +
> +		/* Stop the current governor */
> +		ret = df->governor->event_handler(df, DEVFREQ_GOV_STOP, NULL);
> +		if (ret) {
> +			dev_warn(dev, "%s: Governor %s not stopped(%d)\n",
> +				 __func__, df->governor->name, ret);
> +			return ret;
> +		}
> +	}
> +
> +	/* Start the new governor */
> +	df->governor = new_gov;
> +	ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
> +	if (ret) {
> +		dev_warn(dev, "%s: Governor %s not started(%d)\n",
> +			 __func__, df->governor->name, ret);
> +
> +		/* Restore previous governor */
> +		df->governor = old_gov;
> +		if (!df->governor)
> +			return ret;
> +
> +		ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
> +		if (ret) {
> +			dev_err(dev, "%s: restore Governor %s failed (%d)\n",
> +				__func__, df->governor->name, ret);
> +			df->governor = NULL;
> +			return ret;
> +		}
> +
> +		ret = sysfs_update_group(&df->dev.kobj, &gov_attr_group);
> +		if (ret)
> +			dev_warn(dev, "sysfs update failed (%d)\n", ret);
> +
> +		/*
> +		 * Old governor restored successfully, but the new governor
> +		 * failed to start.  Return a distinct error so the caller is
> +		 * not misled into thinking the switch succeeded.
> +		 */
> +		return -EAGAIN;
> +	}
> +
> +	return sysfs_update_group(&df->dev.kobj, &gov_attr_group);
> +}
> +
>  static int devfreq_notify_transition(struct devfreq *devfreq,
>  		struct devfreq_freqs *freqs, unsigned int state)
>  {
> @@ -942,9 +1006,7 @@ struct devfreq *devfreq_add_device(struct device *dev,
>  		goto err_init;
>  	}
>  
> -	devfreq->governor = governor;
> -	err = devfreq->governor->event_handler(devfreq, DEVFREQ_GOV_START,
> -						NULL);
> +	err = devfreq_set_governor(devfreq, governor);
>  	if (err) {
>  		dev_err_probe(dev, err,
>  			"%s: Unable to start governor for the device\n",
> @@ -952,10 +1014,6 @@ struct devfreq *devfreq_add_device(struct device *dev,
>  		goto err_init;
>  	}
>  
> -	err = sysfs_update_group(&devfreq->dev.kobj, &gov_attr_group);
> -	if (err)
> -		goto err_init;
> -
>  	list_add(&devfreq->node, &devfreq_list);
>  
>  	mutex_unlock(&devfreq_list_lock);
> @@ -1380,7 +1438,7 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
>  	struct devfreq *df = to_devfreq(dev);
>  	int ret;
>  	char str_governor[DEVFREQ_NAME_LEN + 1];
> -	const struct devfreq_governor *governor, *prev_governor;
> +	const struct devfreq_governor *governor;
>  
>  	ret = sscanf(buf, "%" __stringify(DEVFREQ_NAME_LEN) "s", str_governor);
>  	if (ret != 1)
> @@ -1391,59 +1449,7 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
>  	if (IS_ERR(governor))
>  		return PTR_ERR(governor);
>  
> -	if (!df->governor)
> -		goto start_new_governor;
> -
> -	if (df->governor == governor)
> -		return count;
> -
> -	if (IS_SUPPORTED_FLAG(df->governor->flags, IMMUTABLE) ||
> -	    IS_SUPPORTED_FLAG(governor->flags, IMMUTABLE))
> -		return -EINVAL;
> -
> -	/*
> -	 * Stop the current governor and remove the specific sysfs files
> -	 * which depend on current governor.
> -	 */
> -	ret = df->governor->event_handler(df, DEVFREQ_GOV_STOP, NULL);
> -	if (ret) {
> -		dev_warn(dev, "%s: Governor %s not stopped(%d)\n",
> -			 __func__, df->governor->name, ret);
> -		return ret;
> -	}
> -
> -start_new_governor:
> -	/*
> -	 * Start the new governor and create the specific sysfs files
> -	 * which depend on the new governor.
> -	 */
> -	prev_governor = df->governor;
> -	df->governor = governor;
> -	ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
> -	if (ret) {
> -		dev_warn(dev, "%s: Governor %s not started(%d)\n",
> -			 __func__, df->governor->name, ret);
> -
> -		/* Restore previous governor */
> -		df->governor = prev_governor;
> -		if (!df->governor)
> -			return ret;
> -
> -		ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
> -		if (ret) {
> -			dev_err(dev,
> -				"%s: reverting to Governor %s failed (%d)\n",
> -				__func__, prev_governor->name, ret);
> -			df->governor = NULL;
> -			return ret;
> -		}
> -	}
> -
> -	/*
> -	 * Create the sysfs files for the new governor. But if failed to start
> -	 * the new governor, restore the sysfs files of previous governor.
> -	 */
> -	ret = sysfs_update_group(&df->dev.kobj, &gov_attr_group);
> +	ret = devfreq_set_governor(df, governor);
>  	if (ret)
>  		return ret;
>  

Actually, I didn't want to merge it becaus there are fully test for all governor
and various case to switch governor(stop/start/switch). It makes the problem.
Also, there is an AI report indicating that this patch has a problem related to passive govenor.

We must guarantee the safe operation without any side-effect.
Don't update devfreq_add_device and better to make the separate function 'start_new_governor'
and then do next update separately.

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics


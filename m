Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E3E606A320
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 04:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F5CeBEc1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e4+inBjW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=j7W3aHbg+YDWSVhA+lB+EOok8sM/T43n4lzMzoxoN/U=; b=F5CeBEc1y6yowqRE2kfOp6+jqp
	wVz76shrlHl2CuXB6j9CxMzrLtUMOsNLtxJT8Mfhb+Vclyqk01TzaC56+0/xOkxJdYFAjKra4SqF0
	Tsdc6Ry+3KJYuPrtelEGTbRUaJATsqJepjAHCeyhipVKqYiTZ7M9jlstGeNCDK73mtmQ1rMXf9QoB
	ieBo4+NSTe/gKEbJOj/RAcT58DrSZ75p8CGavpDsx91fzrmRfI301ehVi9Atj9wFN7y52AxbJmnao
	DA4XHFxYBC6D/JhH6JLg1T7hlQ3j3MjwUu+6ZDskB2bqBexZZXFwnNUPUmVMtTevtaC/dSS8K81Rv
	mjg21gaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVLrL-00000002G5f-0O4r;
	Mon, 23 Nov 2026 04:40:55 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVLrI-00000002G5K-0VC0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 04:40:54 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so2213419b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 20:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408851; x=1796013651; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j7W3aHbg+YDWSVhA+lB+EOok8sM/T43n4lzMzoxoN/U=;
        b=e4+inBjWsTc2ivuGJfdHkkxKkAPMSvcY3V87KKwQVml/LvQe8R6dkLUcnXOFgAMz2k
         fpGvPqedZdrv7DjCIotOVqFm6vrQ8IH9VyQI8hpeRO+nuQs5xtl0ED0ylgKXMu5FkRAJ
         5DdQtsE1Qtm9jv7LEkK1WvzSYvp+aqZ/uCwuhelUtEpVNTZk+vj69ecXcwlROpNyPP6D
         MQ1tbq485vNVRaYFTowFzqfgfhVzG/9YmFu9eIoZ0i5kSaYRO01z5dcZBeAWfR95PR//
         nkR7tE2NFkQekelFBPD7rUMQ3ORIyvGtMuxCk12TIuWCppIC/uZm4cOj6RhNvOWuQ3Ai
         DS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408851; x=1796013651;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7W3aHbg+YDWSVhA+lB+EOok8sM/T43n4lzMzoxoN/U=;
        b=XvigV+BKPgbkrk3O0UdhaVJDAopSNI5hc3My4aBiSddzf75Wa5/u3MweQ5R0BJi/2d
         Hcm1MqPoGQioPcsSOJPngp1b7Sh+V8Q6eXTWAXj4c0P1bA+lNokiUKnD5Bbkj6ezbyvl
         QgG8f/xkGROJ2zWQxFUUfqMF2uez8rOwQM1I6d8eq/s25Mr5arDw6tHAlLXuCR77JSTU
         w9clY0kOJzJI4uNfhZh8xfkK7R8cZSy4IiP2gfS34UYADLTCwKVvJ3Wpxxizpo8SuH/U
         3Il7ldfhyA8IEs7JdtmmTbJn/W5G4zD96R1m4gACYZ7BdBlMkOu0m76Gh7ninUfbElUC
         M9NA==
X-Forwarded-Encrypted: i=1; AL+hErEzxwYhH9yvAOE4syjyA6Ak6gKMCKaDsWyIMUN2f2RxYMsk98vTpHNsc7PgNPwb62Xt/UHmytGlvbHNMKrdPCTB@lists.infradead.org
X-Gm-Message-State: APuU4Z+sLEe5ME5Z+IcRatqdYdAn5cVu5M6tFVYiaLb8yR74YTUfKjbw
	NGyrAy0IrlimZW+HuCu2Umqj1ipAzs/9Rq0itZApzwK4E7gA9v4uKgEtkTdk4Q==
X-Gm-Gg: AZFdTZeiHGnoxo6NZXcHqQbwOg61VpN8LvedD69QSrpwUMDw0vjIdSkz0II3h+teDCP
	kVwH6vGxfxJEq3SnoMGvv3tkANa5yUCVo/mmR0r07+K/h3RBQqWHIx7yRv7pu7+fYr9rh2FY7Jv
	H1DI1n5PKIxymBVLiwH9OxtIIOcMY3LlQ4/g1N/KaQca8tmlQYWLvyQCCH/eCjXTrj7uYHHqBRR
	a+86iiWbsp1kkF8tPidetnmhcUWP4qCnR7jFC/SjZPwTs7OfYVCv5IdiWmUOUcMKyNMV1rZftCF
	uqohLzKOpeqWU1LmVtd5PMl1nMxZe60cW+WQpRmBvOhrGajutm0G9s9qMa+9Dnbe/VjpDErRlFw
	tYrxauyJ9TW+zBQB39glHEePY/C5ZdiRGdLUd6y/cF7fGACezn+WDJMzxy2ji9ndFwRNSsl6l6D
	zudEmUCEOta1lo1thh1xVE2OqMg4fYOhVUDSycLz7hKCjMQLEn1tl6W8+kP/HT5KfqMjHGUsQGy
	ePaGkKKrujQimMDALG2l82YiHQ6XrM5lvANPsZmgaI/DjhAZLH5dveD05YtVTQ2OoSmrlA1ALjJ
	bQ4+vM014ZorNC9um0OwfEF+s3aW/XiRUuKLz7r4ePpO7HSSBoM9MEen32jyw17eV4ucQZ0=
X-Received: by 2002:a05:6a20:430d:b0:3fb:1640:c525 with SMTP id adf61e73a8af0-4014dd5bab0mr10831025637.67.1795408851193;
        Sun, 22 Nov 2026 20:40:51 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c29sm4324017a12.1.2026.11.22.20.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:40:50 -0800 (PST)
Date: Sun, 22 Nov 2026 20:40:47 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>, 
	"H . Nikolaus Schaller" <hns@goldelico.com>, Kris Bahnsen <kris@embeddedts.com>, 
	Mark Featherston <mark@embeddedts.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	linux-input@vger.kernel.org, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Input: ads7846 - drop platform data support and
 cleanups
Message-ID: <awPDq900dc82rWOz@google.com>
References: <20261112064957.1796975-1-dmitry.torokhov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112064957.1796975-1-dmitry.torokhov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_204052_871638_713858AA 
X-CRM114-Status: GOOD (  11.19  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 10:49:52PM -0800, Dmitry Torokhov wrote:
> Now that all in-tree boards using ads7846 have been converted to Device
> Tree or software nodes, this series drops legacy platform data support
> and its header file, simplifies sample filtering by calling
> ads7846_debounce_filter() directly instead of through function pointers,
> removes redundant memory barriers, deletes dead code, and cleans up
> minor coding style issues.
> 
> Thanks.
> 
> Dmitry Torokhov (5):
>   Input: ads7846 - drop platform data support
>   Input: ads7846 - simplify sample filtering
>   Input: ads7846 - remove unneeded memory barriers
>   Input: ads7846 - remove unused code
>   Input: ads7846 - fix minor coding style issues

Applied the lot.

-- 
Dmitry


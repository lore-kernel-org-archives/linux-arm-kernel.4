Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22914606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 02:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ulg/DPZ5;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BCmpAss/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1kvVsvJjIcPmelr/AshpBT+XywkQ9wH3ZnOEGYSU024=; b=Ulg/DPZ5Fs2FuO
	BqXv8ba4JjOruiQDd8IayhYRBb6k/7SPDKC1czQt+hLrWtpRRlM/RjeIBNFVQmAcveOeSe7JU+ECn
	S/hYLXAVBhf6DxytW3W4mhtEFjfmwOcI2YTwR31d87dQDpwNmW/7Y+CB6yyqNPYuGTrJWJpBu4Pkk
	Ck0OOliTrY+9lbCuqClf9r1/nlqZTwMzgQ10VU940iiCudzDXQuOYR5aAaDSnVX9U/9Z4zpg7+6Za
	ohKU/kYpJvGSs+VXgYuPXSuC6Dvg44F4Y2QNdkTEt29WOfnRFjI1AaZNz6eJnuDHY2BJlL1eFckas
	M0mkrJ73qQDFzpKR0Lwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlgR-0000000EmSI-3qhp;
	Fri, 27 Nov 2026 02:27:31 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlgI-0000000EmNO-02Ma
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 02:27:23 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso4311431a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 18:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795746441; x=1796351241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kvVsvJjIcPmelr/AshpBT+XywkQ9wH3ZnOEGYSU024=;
        b=BCmpAss/IMSyia92lpeE5ZSU3s8gGKrbMNqgeU8NB97tM1jfwf8we4RiOO772TMAuY
         OZmqcNL/au0wjgqcnj2goq+D5a0IHqzCSAIavC5wh633LQSDnBDNdraEj2XzwgbcqPRo
         s2CONlsjq66an7letzokEQKzQasrfiLcQPZp3ICdvBoc6lCWaVk845OkpsyTCFUIwfPR
         EURaD5/a9/QIdXLk7sAlkUuhQhAo8eFchBSp8KqI4SMJ+KXLkwrJZ02nXxg0FEl676YY
         KVvvAn+5aQvqRhhLEuiC2t/6mSM5MY/srUbDvjzwc6qUX2kQcyljQSdUhEcgaWfIzQ+y
         X60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795746441; x=1796351241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1kvVsvJjIcPmelr/AshpBT+XywkQ9wH3ZnOEGYSU024=;
        b=TRJ/hTiSIRRnHji2dd0eeNSuTovzeWL9qhRUXhWjPiFzCt7SE7uSUIWVR+P2pUFJAT
         OylBRr0KcAxQvsYSJYjl/AnEKa6Qvm7ekSrnmsmnDWk/TA8G4TRU8mUuqUbbam3VuAYs
         H8zPdC1MajK395SadbGgLCJziBzWKpbKnDBnGGsZC6BbhE08OUVtzZiWcbexetmeH5DJ
         HSJPPw4UiksMi/RhnXFMkXBUnIdPq6xBHiJWa0JDb9FsnAxAfstXBOeP6CdZhn2PkeWc
         DtzwbT0dhgO5efxQXl1ypCK2r7vRvMKKcyxbX7VVSk5hgqh53MXyAu5YDjWPFscYmz8W
         3pZQ==
X-Forwarded-Encrypted: i=1; AL+hErEnwmHda3mJ9P83bYViwm5QdhVM7w0UAIbAPqSiFLRtJrsN0x9P9Wz3eTxWB004mcUiPzUCz4ItnNp1R6FXPuBa@lists.infradead.org
X-Gm-Message-State: APuU4Z+sK06NSFywMej6WKBo2LfTcmatzxlWkElPneiWZ2COk+Hv2IMQ
	vdtKgJ7gMs8bzvNeUwNReP6krvAa2Q3NIfxuOCNvGjSoQawKEj79GJ69
X-Gm-Gg: AZFdTZd18Cnw5BM37BIVlnm8Wq6XqzBCg1agr+0XWqkeUuCGHK7W2SfZVMfaIPTVjj5
	zj92X9AgIRSk3rQl23JhCflbNcAkHKBrujZ8hlTYBG5YrW18KXpYbuxF5Mt3rr8zbPJOPwLNjPz
	u/dGfJfJkYGhawrKPmNPp1mtks9I24GC2F0wjiuOvAObRBo7n+vDqtF/KncpKIyl6RK7WkXGHvU
	iPH6aZJjOVY7tH4uPra4+pQzcq5xoDXh7sIRuLbhlcHDVj8LSg4hvoInvJ8w6vka0C4NeJwG1/H
	S3qiDYlneS3CZeb+oV7wyKs2r/QZLrj9Bpldq7iGC2s8+QUXJGJMC+llln12uHbbBjDVixoXRq+
	G6MQJBVz7/LViLBOW9HvoiKeIXPoYKKK6sLmu5k9p0sRw8PWeo7F8dTs9XkfsCLPWRlrICeyQEc
	waLNvW0tm2mfc9mTdehWzscIDlQolwx2G8HmrIwGKtfQDNTG8VFwbjagtJAN30wAU02V9m6NBsb
	7o6al8FqVK8S84ufqMg0cHZRdPbSnG0UPfT/UK9Dvt159FkkUUVUNtL3JpsK+nJSxMK2cXuA7X6
	NyppnpABXxJIV8T2pxtb789tgu6Qyj88AYY4+74CL/xTmfbZZbbU0Ym/Hgz4CU1L9ZWr2hBIG3q
	EJRDOYRo=
X-Received: by 2002:a17:90b:2416:b0:3b4:a6ab:b846 with SMTP id 98e67ed59e1d1-3b4a6abb9e0mr6418713a91.17.1795746440731;
        Thu, 26 Nov 2026 18:27:20 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-229-10-180.dynamic-ip.hinet.net. [36.229.10.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm37142870a91.3.2026.11.26.18.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:27:20 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: Slavin Liu <bolin.liu@seu.edu.cn>
Cc: jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	florian.fainelli@broadcom.com,
	kernel-list@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: pispbe: check configuration buffer CPU mappings
Date: Fri, 27 Nov 2026 10:27:16 +0800
Message-ID: <20261127022717.685080-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
In-Reply-To: <20260913125224.110051-1-bolin.liu@seu.edu.cn>
References: <20260913125224.110051-1-bolin.liu@seu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_182722_054550_A105D394 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 13 Sep 2026 20:52:24 +0800, Slavin Liu wrote:
> Reject the buffer with -ENOMEM before copying or validating the
> configuration if no CPU mapping is available.

I tested this on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39),
together with the other two pending pisp_be fixes, by rebuilding the
pisp_be module.

Queueing MMAP buffers on the config node still goes through the copy
and pisp_be_validate_config() as before (an all-zero config is rejected
with -EIO, same as without the patch), and v4l2-compliance -m on the
pispbe media device passes 400/400. I couldn't make vb2_plane_vaddr()
return NULL here, so the new check itself isn't exercised.

Tested-by: Roy <rongh7426@gmail.com>


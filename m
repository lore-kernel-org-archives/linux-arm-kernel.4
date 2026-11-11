Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB9C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cBAIVmxc;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kHGSC6rH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Qdx8SBFr5A9el3l62V1Hnpyo8SLW7HjNDS/vMXmANvM=; b=cBAIVmxc3rELQ+
	UhVpDqEkMQQ7qMmZvhTq6hX3ElMrjJz77ReYauzpDsvTb4VRTX+UiD1j8vedm8CQcnpZU61zdHEcN
	TPahQn4bOlSj7i1dwqrC2fG9Ixhk4+x+OOvHounsJwqVyuFPuUbtRoVXMTniD0+lesUVA8tbOVoK5
	ryOAIdACUWVLmiIaMQnNSDeZO911+xnbi74orkc9EHFQrbBgEifClAEw4JVpd8ZKEl4h9m69aDbcH
	C2Ne9BkhlV6YFIYCvzNqN0d6r2wZPWdLFGbGWfQMmLD7io/GZxxNlHcdxCP79ozWifx68J5WgYlwl
	vJzuT2oYFBO7lYcA0yIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8hP-00000006sEk-1fB6;
	Wed, 11 Nov 2026 13:49:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8hO-00000006sEc-00pl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:49:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 112CE60DEC;
	Wed, 11 Nov 2026 13:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C871F00A05;
	Wed, 11 Nov 2026 13:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794404952;
	bh=Qdx8SBFr5A9el3l62V1Hnpyo8SLW7HjNDS/vMXmANvM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=kHGSC6rHES3fHGZkuagSOTPK0LWKUZKCjuI+lKf1BasID5OyztlT+Ko/nNpHMz4Sv
	 vPAcVMYZPLUMmmqJCkf1oJjzzW6wkhqQ8ypErW107oHctP34/qcyCdss4xUTb6qQja
	 nOqGHv5GsAovhkdPZxCk1ybqg3zw7k8AXnC2viWd6wc+BVvA6sXa4KHjdNry0+KKQ3
	 M9neRAmq4YT8GzC/oY/GKN2OGEC1piS7TW9gn7ccAXrbMDsGLeqgqOQ4Ui0G7OvsxZ
	 aUxrSMvyzFwDzfCJUFgYI6yA9/fWRUlZxJVj5/nuV3CRsGjZXBe78pwJwitdKROhku
	 Fu43Uec9NT9ZA==
Message-ID: <5b068d22-4f46-4f82-8914-ffed5a0f6f0f@kernel.org>
Date: Wed, 11 Nov 2026 14:49:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 0/2] media: aspeed: order probe cleanup and last close
To: Myeonghun Pak <mhun512@gmail.com>, Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jammy Huang <jammy_huang@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
 <billy_tsai@aspeedtech.com>, linux-media@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Ijae Kim <ae878000@gmail.com>
References: <20261109235731-aspeed-v2-0-mhun512@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20261109235731-aspeed-v2-0-mhun512@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Eddie or Jammy,

On 10/11/2026 05:58, Myeonghun Pak wrote:
> This revision requests the IRQ after its dependencies and synchronizes
> IRQ/work before manual probe cleanup. The second patch fixes last-close
> ordering and keeps the engine available until VB2 release completes.
> 
> Compile-tested on ARM64 with LLVM, W=1.
> No hardware testing.

Can you review/test this series?

I don't feel comfortable merging this without your OK.

Regards,

	Hans

> 
> Changes in v2:
> - Rebase onto managed reserved-memory initialization.
> - Remove the research sentence and Assisted-by tag.
> - Join the IRQ and delayed work before manual probe-failure cleanup.
> - Keep VB2 release before normal last-close hardware shutdown.
> - Drain the IRQ producer before cancelling resolution work.
> - Balance IRQ disable/enable within stop and check STOPPED before power-on.
> 
> Myeonghun Pak (2):
>   media: aspeed: join IRQ and work before probe cleanup
>   media: aspeed: drain IRQ work before stopping the engine
> 
>  drivers/media/platform/aspeed/aspeed-video.c | 38 +++++++++++++++++++++++++-------------
>  1 file changed, 25 insertions(+), 13 deletions(-)
> 



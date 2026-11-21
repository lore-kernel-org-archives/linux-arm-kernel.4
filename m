Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93529606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 14:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QL+9GK2V;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BKc7kr3P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rrvd13JKTAJkceUzoJ4Gts0V19EDKxpu2AyZhzxOjdk=; b=QL+9GK2V0dZtUF
	2EBeluD4O4fRuzwmPvoHnrTErQm15bUBUEtNsv9RdR23k2+4QBGTeeOEPwj/uu5SG+C5bQCEUGmOA
	la27HteQbSqSvALsrNYaoRFUHy0T6sl26NG76Y8UKdVzXlvXGrlfVEIAW9HxN+kVW7b0pLJdAu2ew
	6htJd2WtMb16BtKTmJYJV9cj3Ljku6+EnRPgqFY1vQFttJ2les6Vi2d9jfqubqRbI2iX0+7ZFseR8
	piPd/IKx0TJuxol9dUDsD4raQhXdjQmQWRrNf2ExkcpwLm/P7vNIjIlfM1hKHb8uonXhle5JgWUFn
	O07E1wa9CiDMJWrjkfkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUlhZ-0000000HK6X-44TA;
	Sat, 21 Nov 2026 14:04:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUlhZ-0000000HK6R-0bCw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 14:04:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 85BB641424;
	Sat, 21 Nov 2026 14:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A55B1F000C4;
	Sat, 21 Nov 2026 14:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795269864;
	bh=rrvd13JKTAJkceUzoJ4Gts0V19EDKxpu2AyZhzxOjdk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BKc7kr3PEUvu1FyLwIC7SJ1m7toK7k6mXnXtMuFUjmFZ/GWsZ9tJ4vMiOg7oHWeLT
	 sPio6kfyM5284Nq1C7bgWVYxuWT5H/tgvtCuJRJHJGJLgJcHtxjbJKT8Lq0qX8eelG
	 szBIP+LL3Uw6iDCLYJmq5SxZxBFiSVWmW8J/Gy+kyOar7ewJcb7oujr/ilwVWr5LiN
	 2LXc9lOVW8nwUmzeAxnNx9eJZhLiKy5keRxxB2Xd8JIvjqSQ+TuJe2W0HV5VNv7Xgp
	 0NzcNKpCkoz5hrDVYmFjoQyzBSG15FKyZeKqyASfXYn2FU4Tv1JW0gIIasrTzwXZzE
	 jIe6IfcAyP5Lw==
Message-ID: <57ef8e25-c4df-4907-8f05-0a104c537d89@kernel.org>
Date: Sat, 21 Nov 2026 15:04:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] usb: typec: tipd: Factor out i2c specifics
To: Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alyssa Milburn <amilburn@zall.org>
References: <20261121-tipd-ace3-v9-0-9a2f1327a330@chaosmail.tech>
 <20261121-tipd-ace3-v9-2-9a2f1327a330@chaosmail.tech>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20261121-tipd-ace3-v9-2-9a2f1327a330@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 21.11.26 14:07, Sasha Finkelstein wrote:
> From: Alyssa Milburn <amilburn@zall.org>
> 
> Make the core driver more bus-agnostic to prepare for SPMI variants of
> the tipd chip
> 
> Signed-off-by: Alyssa Milburn <amilburn@zall.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>



Thanks,


Sven



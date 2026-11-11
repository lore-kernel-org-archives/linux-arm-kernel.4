Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8FA606A8A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=did+pEXt;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=fQ7Jo0y6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Q7nTbtg3NOHUNDWE397ThEwNuYuuiTDqnX6yT9Vqs8E=; b=did+pEXtUvyRS9
	MMGnZcmEdrDMBlJOQdjnh+4A8LnlUtc92dOT2J2qnoTFdy28lT7wwPmLS/QRfK831ZFlqhFdofGPb
	nNinKpGCtk82hiZrJoEfm/QqgQvv5YaqFhIRb13sH2e7PCM4FO04wvHacK7tu5SqqV0c6ewDa9WmC
	bWqQqADbxv+gQ+vo7zQtULqmorTs87ql23Tljj3ZHfYEfcY5tcJ30Id3REgqri+sjA8n8hE6iR5dX
	3Eh/xqogv95o7asUkOGAcbPRbVI5sw6cVOHbCoyCprAa+DVBOT2uwNZTlgfeI9fztLmYVDj4t29Wt
	8KCMRwSCjV71kUwJnwWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9No-00000006yBf-0osG;
	Wed, 11 Nov 2026 14:33:04 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9Nl-00000006y81-05cQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:33:03 +0000
Message-ID: <fb7b4ede-a325-4c5e-a37d-fe3cc7a92f87@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1794407575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q7nTbtg3NOHUNDWE397ThEwNuYuuiTDqnX6yT9Vqs8E=;
	b=fQ7Jo0y6y1TRDYwtYJgO1STJDXTDFtL/3trxMkZ0Ta6gVXwNHfIfQ/Ezhct73kXpoVFQWr
	4m7n74TvisUz6uatQ6SYNsbV4EeQw0ifL4ObQhnQ/uKYDaJehRR+ahM1hiEeja9VNgFDeS
	MpCJ+MZO13xY97WzfIP+bYOcF/+1tLQ=
Date: Wed, 11 Nov 2026 15:32:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 03/15] dt-bindings: nvme: apple: Add apple,t8142-nvme-ans2
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, iommu@lists.linux.dev
References: <20261106-apple-dts-m4-m5-nvme-v1-0-22f4827b4ece@cyberchaos.dev>
 <20261106-apple-dts-m4-m5-nvme-v1-3-22f4827b4ece@cyberchaos.dev>
 <20261111-comical-quaint-turaco-e8c1c2@quoll>
Content-Language: en-US
From: Yureka <yureka@cyberchaos.dev>
In-Reply-To: <20261111-comical-quaint-turaco-e8c1c2@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_063301_341755_C1C8DF1E 
X-CRM114-Status: GOOD (  12.87  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/26 13:46, Krzysztof Kozlowski wrote:
> On Fri, Nov 06, 2026 at 10:04:12PM +0100, Yureka Lilian wrote:
>> "apple,t8142-nvme-ans2" on the Apple M5 SoC is compatible with
>> "apple,t8132-nvme-ans2" so add its per-SoC compatible.
>>
>> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
>> ---
>>   Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
> Squash all nvmem patches. Don't add compatibles one by one.
>
> Best regards,
> Krzysztof


Hello Krzysztof,


(replying to all three of your emails here)

thanks for your feedback! I did run `b4 prep --check` and `make 
dtbs_check` before sending and it passed without warnings on all 15 
patches of this series. I will now also run `checkpatch.pl --strict` as 
you suggested.

For v2, I will make one commit per type of dt-binding, so "dt-bindings: 
nvme: apple: Add t6040,t8140,t8142", and then "mailbox: apple,mailbox: 
Add t8132,t6040,t8140,t8142", etc., ok or do you have another suggested 
grouping?

 > Please stop inflating this. You are only making it difficult to 
review your work.

It would be appreciated if you can tell me clearly what is expected, as 
this statement is not actually telling me what is inflated / wrong.

Thank you!



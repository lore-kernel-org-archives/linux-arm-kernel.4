Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135AB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 00:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WtaLGYTJ;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=SpcLCQhB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=H6tRRsQCF4iyzVxbUzhJCcNKza/mMttiKLDZ5wLU/Wo=; b=WtaLGYTJb9JKXB
	7AAxZu5ov8xqqM/8X1qu8VboBFg2xXXJvfNGxkYmc6BDZnForlgviTvKRvft3JScwumwHlNERtwtE
	dZGCQOM5+iNylnUTSJHXqGKdRAtkBiYrGrIT5op4vBvV9FKWNSvqu8X35b0x8BYrNLGlatosWUjXU
	xeQV25IVR//0o4NGmVN9MD0n5R0BiF36jXTRTRXOnNrMlBOTfz9Se2X58loIV20Zjlr8ggxem3eSF
	MV6vHLY20nvZIcQPhNgYHYYTHzOJiOvpaBthlf7cVPG1Zuam4I1+ArUW2J3uIMK9ABHguCSU+BDd9
	4VmUyLiPKvTj4V4hOnaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWjhh-0000000Ego1-3pDe;
	Fri, 27 Nov 2026 00:20:41 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWjhe-0000000Egnd-2Zzr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 00:20:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E30810A5CD;
	Fri, 27 Nov 2026 01:20:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1795738832;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=H6tRRsQCF4iyzVxbUzhJCcNKza/mMttiKLDZ5wLU/Wo=;
	b=SpcLCQhBdkzksljTDxldG6WmnKmqpLXIivzMR94GmIDRFQRYx5Ka2Fmj88IgSpC0JA5dsW
	edkpaGR1OSTHY4CxAf4C7PJaKbh1zvNxlFMlxMaTg2EDyz3I+4NqHkn+J0L/sPvxKap9kS
	u7h+uNTDptkbZ7uPkrRBCoH8A3Tng5EWazvkGE2keLlEuQeFFK7WWEhtJteIAic0rnRBPH
	semGo6osjkKpX6+Wf0tja23NeZFCSnyAktoZLCeZOdq2quvBdaBLeX8lv05PJXkBYukXwz
	+Qfi/XNihhED6v8hawCh6qMZob4DIz6fh5oXQhk05mZthoN6L/KSUUwVPP3PPg==
Message-ID: <1ff22f13-08e5-40a4-b061-07b50b0135ef@nabladev.com>
Date: Thu, 26 Nov 2026 10:26:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] ARM: dts: imx6ull-dhcom: Change eMMC pin configuration
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Pascal Zimmermann <pzimmermann@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel <kernel@dh-electronics.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <20261125125621.6734-1-cniedermaier@dh-electronics.com>
 <a57373f2-dfb2-4344-8e2c-6621a623d170@nabladev.com>
 <4ef4ff8128b049d59a0ab23bea906468@dh-electronics.com>
 <5e607c068ea54d5a859e1de82c1574b7@dh-electronics.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <5e607c068ea54d5a859e1de82c1574b7@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_162038_885653_30C43337 
X-CRM114-Status: GOOD (  10.26  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/26/26 9:51 AM, Christoph Niedermaier wrote:
> From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Sent: Thursday, November 26, 2026 9:25 AM
>>> On 11/25/26 1:56 PM, Christoph Niedermaier wrote:
>>>> From: Pascal Zimmermann <pzimmermann@dh-electronics.com>
>>>>
>>>> Tests have shown that, with the current pin configuration of the
>>>> eMMC (usdhc2 interface) read errors can occur with a certain
>>>> type of eMMC chips.
>>>
>>> Which chips are those ?
>>
>> The problems occurred with chips from Macronix.
> 
> To be more specific, the model that's causing problems is called
> the Macronix MX52LM04A11XVW.
This would be good to have in the commit message.


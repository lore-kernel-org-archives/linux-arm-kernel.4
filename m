Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0822E606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 14:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MfprQqN7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DkO9ZyBD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lv3NYu11pHprgRUUKX5nzbXJ9PYh0wkr94sy1z7rgm4=; b=MfprQqN7XxYRcd53R4y2kuyV1m
	V5qUwjoViqJxHf9jkHTfb58BWPcWTbKv8IFcyHMtc4If+zWj6wpiV2HMrn1aWX8BFAJ3NNlVKKgXm
	ONOQnnORJO+0jl97sqM4W7Eg3MuxOUcDVLtsK3WZsWdRq5lurnna5TaEQcjOpD118E2f7rraVB6qQ
	QCrebfDHo+f2G9O9DP4yB9RIE82LYwRYUPPLrja4J5vT+pklhn3yMiWHddmMljZPzKB2s2lhuGPbM
	Pnbzk5tNObt32+/bcNG0xiFcF8YaEAMXxgyWEPyCSTlyY/HFSAp4GZJ4xOYe3tcnnccHDTVjfTKR6
	qG2w0eHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3CH-0000000CEkz-0bfc;
	Thu, 19 Nov 2026 14:33:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3CG-0000000CEke-1wB7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 14:33:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 0AF3260A6D;
	Thu, 19 Nov 2026 14:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3738E1F000CA;
	Thu, 19 Nov 2026 14:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795098786;
	bh=lv3NYu11pHprgRUUKX5nzbXJ9PYh0wkr94sy1z7rgm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DkO9ZyBD2TgaZMRcs8EgWiOCyNyqCS5GVpH0PIaxsiAxioBTNKOP1wNtv66D5cYUo
	 SVbW8UDU1ecj5E3RCQAhHUNANk3OefmNfhyVcaUvR0Gz4clykNB0Ug9GoG1Ptr8ZuJ
	 ONnfC20iTyqzzJ2bUJn6Pg6qw6zmZqZ3ZatVKnDFWAqwRPzMWGYReKxU4oRi50tS1Q
	 1qTF54aQpt4AAtXTH2qm2wUUGVJhq8ji6yCXpiUz4OvXBnHZfzrVs9GnUElmUD670e
	 vrz7s2wx6vlq7TxR3Li0W0SBs0mp7rRKPrBjNuC5IHgS3SdNuJjawMEJSGy/3xT0BT
	 6PR8vQwsFHWZw==
Date: Thu, 19 Nov 2026 16:33:03 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: Rodolfo Giometti <giometti@enneenne.com>,
	David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Jens Wiklander <jenswi@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Sahil Malhotra <sahil.malhotra@nxp.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Richard Weinberger <richard@nod.at>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-crypto@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-api@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Demi Marie Obenour <demiobenour@gmail.com>
Subject: Re: [RFC PATCH 0/9] KEYS: keycrypt: keys that user space can use but
 never read
Message-ID: <av8In0Xyd5iI9N7K@kernel.org>
References: <20261118140421.584086-1-giometti@enneenne.com>
 <650f89ef-9745-4f75-b254-80fa5ac4773d@gmail.com>
 <av5EyVHnNzT27dyK@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <av5EyVHnNzT27dyK@kernel.org>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 02:37:33AM +0200, Jarkko Sakkinen wrote:
> The exitential problem here is that KEYCTL_CRYPT_OPEN creates a circular
> relationship between the keyrings API and a specific key type.
> 
> At hardware level I did not see any support for TPM, which narrows down
> the potential user base.
> 
> The remaining potential user base is further reduced by those that use
> trusted keys; leaving out those who need to solve the assumed problem
> that only this patch set can presumebly sort out.
> 
> And we don't really know at this point that cut. This is pretty much
> the break down of what is wrong here.
> 
> If there is/was a problem to sort out, it should be so constrained that
> it should be as quick to describe as stepping over a nail really.
> 
> These are the main topics what I would focus on.

I'm not disregarding that there might be something; and neither
disregarding e.g., the use of Claude. Throwing a dice can apply as well
human made code as for me code is just code. Perhaps using Claude,
people just tend to have just a itchier trigger finger :-)

The place where *in my personal opinion*  anyone who uses agents would
be better to do manual work is the commit message. It enforces to use
cognitive abilities even more so than writing code, if you with
absolutely no self-deception, read it all through and write with your
own words what the heck it does.

Usually when hitting the wall doing that leads into better code
because of the healthy reality check. I'm not a medical doctor but
I believe at least that thinking more stuff like this is also great
for long-term health and cognitive abilities.

AI is for mental health as a car is for physical health; for better or
worse.

Code quality is also over-rated although best effort should be done
but that's all. If you get it, then it is done. It's harder than it
sounds without self-deception part.

And yeah, we don't have projected problems. I.e. "no users" is always
NAK. You have to step on the nail at first.

Just need to clear my thoughts on overall the topic :-) This is I guess
where I stand now. Hope you find these helpful.

Br, Jarkko


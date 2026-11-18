Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5A6606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d6URmltY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ik0wB+4P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WpNvKlvQgWs4nlBDzrAzqY0K1wpz+T9bN3CMOunjYys=; b=d6URmltYDGJ4cipVi7H6fQJnrK
	rOEl3TZb2YqNWyOWVPzAz0Ns6w/dI0b9KUHA1zz2bYEUfnNSToti/86fS9un1jjlZsES2dzVgqPIa
	a1MW+b9CHUbGczjYp2tCQ973kqeqvfV5YAkpE6td40kYAb9QeNmKvvlqvhtChSErWKYNSTokC++/q
	S7Ja6Jy7faHIwk6ksdyPYDaBW399EkIcWA3xaUlFsg0Felt9mwGVSZXA/Yk0uHw+jCbmNo0nMulho
	uEV5ICU5qqLBgWal+DOE7foBo9CfYz5tG1+qAMnm3wNwuJmmnbnN3UzheOceDdhb9f5QhDakfzG48
	hGv/CzFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThGL-00000009CUO-2L3m;
	Wed, 18 Nov 2026 15:07:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThGK-00000009CUG-1Cpk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:07:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 8E70743DC3;
	Wed, 18 Nov 2026 15:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C01C41F000C4;
	Wed, 18 Nov 2026 15:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795014471;
	bh=WpNvKlvQgWs4nlBDzrAzqY0K1wpz+T9bN3CMOunjYys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ik0wB+4PWOYL2hmQiNwFTeBBvupZ2nUcJiZ54iyfaa2tU77mnLlpFifyj8n1RAoxc
	 JiFr1whbKGn9jctVHgQHsWlXlRxqGaOAejYgryvppYJ1hYUJPmJajsbl1RZNJZ2urH
	 fAR3taWBeKxDwuMnnlsPRwbWW5GR06M9hA5dv1M1pEA51yEPNLWXKWfBsoGOA85JWU
	 RdSwiNfRnISgDS/zRQ8IFyTjSctGJRDAEhTnp4ENDN8HwGtDmIypnNR9Lro8os8drC
	 gH5m26+2mcTSgygYysYIO2BPjm0gAz6kctoO3OxBWgeB2Wg89nS8C+lhRUQ+5galCW
	 RrUE6ZrvqIprA==
Date: Wed, 18 Nov 2026 17:07:46 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
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
	Eric Biggers <ebiggers@kernel.org>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-crypto@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-api@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [RFC PATCH 0/9] KEYS: keycrypt: keys that user space can use but
 never read
Message-ID: <av2_QoJHp1gMTFMp@kernel.org>
References: <20261118140421.584086-1-giometti@enneenne.com>
 <mvyqqjhvfka3kkumztixzozrthutkq6mfakkonxqbpm5gvzb62@eitzzleeyioe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mvyqqjhvfka3kkumztixzozrthutkq6mfakkonxqbpm5gvzb62@eitzzleeyioe>
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

On Wed, Nov 18, 2026 at 03:57:27PM +0100, Marco Felsch wrote:
> These are basically the trusted-key purpose.

This is it.

If I was adding something like this, I would at least:

1. Discuss the solution that would extend trusted keys to the level
   that makes it crystal clear that this is won't work out too
   well.
2. Then show how the new thing addresses all of this.

If there is any gist this should not require whole a lot of text
dump.

AI assistance should not be really even mentioned the cover letters in
my opinion. It's equal to text editor; or smoke signals. It does not
level down anything i.e., I'm equally dissatified however this was
produced :-) 

Br, Jarkko


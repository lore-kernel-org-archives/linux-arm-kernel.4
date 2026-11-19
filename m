Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E860A2605
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 00:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qUkaDw9t;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VSxT9huh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=25HxFNVSbdwyEfeQT/v/hb2lKg9U17dcPsjF33ZXCwc=; b=qUkaDw9tcX2qQnXHYGR3Gq6Mk9
	gDDt1Yzvab56rjbJ2XURKaKYKVUcEmJpNRHPui2hQADQz5E9iT7Qs/wipuuLOmme5UxeRZj5sY4f4
	FEGcJFi7NAB6HfCSVVAycjZ8Lg3aaGRKQ2c+NRGXSiR/X0atbUsdkOQ0P7Omm3BU1yfrfNlILaA1s
	Sifo4B0elDOBd98CrtMb687lUw85ixBjEUrjf7GRZyg/Fs8J/u6f1Ci7bkGbLmUJh1Ne9HS9Ry/AS
	NLQRL1APKTWSTZn/jJoXQrtcEA6cwINtTsXF8YQrQ72zsSzGUM437qC6RwCqe7xUOd/wRnAOci6Pp
	xAVvouSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTqQq-0000000AbXR-34zd;
	Thu, 19 Nov 2026 00:55:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTqQp-0000000AbXJ-1BmR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 00:55:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 48042642B3;
	Thu, 19 Nov 2026 00:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 6BD871F000C6;
	Thu, 19 Nov 2026 00:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795049718;
	bh=25HxFNVSbdwyEfeQT/v/hb2lKg9U17dcPsjF33ZXCwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VSxT9huhMwIVOvdxA1oFUsA4Z3PU2/6QKN1JtOI9ZSJErZpgzNWfQOcPlKak7TIE4
	 tm+0xSyBkBRfpn8XMWTzqp6KgUlDMmSl0HEHE90q5hwkySZIy9ns74+aW5YDlu9QwV
	 vwcxJUfaAxhlXZj0yYWSuZ8ZbfS2AK6rkE6AUIW0ogLTDSl9WRU2XQN9k6nL4Fy8mv
	 C4L9LtEdTSU97TB4VEGpS/gI+hAGPUHp3DtgSFei2y7DITtIFMXh2ymqvxfleCFenG
	 HZgKoVAwIiKWIq+u3tkkkmJxz6F1QUKEAxNhZ+GdXSpvRLONSfa7LYlJ4B0KvBgLyc
	 SaJhYffuT9SzQ==
Date: Thu, 19 Nov 2026 02:55:14 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Demi Marie Obenour <demiobenour@gmail.com>
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
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 9/9] KEYS: keycrypt: Add the aes256-gcm-stream
 algorithm
Message-ID: <av5I8lhExyKvf9w_@kernel.org>
References: <20261118140421.584086-1-giometti@enneenne.com>
 <20261118141257.627441-1-giometti@enneenne.com>
 <75946579-8335-4491-86da-fcda25ae9fd8@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75946579-8335-4491-86da-fcda25ae9fd8@gmail.com>
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

On Wed, Nov 18, 2026 at 07:25:09PM -0500, Demi Marie Obenour wrote:
> On 11/18/26 9:12 AM, Rodolfo Giometti wrote:
> > This patch is a proposal on its own: nothing before it needs it, so it
> > can be discussed, or left out, apart from the rest.

If there is no one who needs this, this is literally throwing a dice
with Claude.

> > 
> > aes256-cbc does not authenticate what it decrypts, and a file or a
> > transfer longer than one call cannot be sealed with a single AES-GCM
> > invocation without buffering all of it, nor decrypted without
> > releasing plaintext before its tag is checked.
> > 
> > Add aes256-gcm-stream: the STREAM construction (Hoang, Reyhanitabar,
> > Rogaway, Vizar) over AES-256-GCM. A message is split into segments
> > of up to 64 KiB, each sealed with its own tag under a subkey derived
> > with HKDF-SHA256 from the key and a 16-byte salt drawn at
> > KEYCTL_CRYPT_OPEN; the nonce carries the segment's position and a
> > last-segment flag, and the counter lives in the kernel, so segments
> > can be neither reordered nor dropped from the end unnoticed. The
> > segments go through a new ioctl, KEYCRYPT_IOC_SEGMENT, and
> > KEYCRYPT_IOC_FINAL reports a stream whose last segment never came.
> > A tee or hsm backend draws the salt and keeps the counter in its
> > secure side; the sw and optee backends implement it.
> 
> Please use Cobblestone-128 or Cobblestone-256 instead.
> https://c2sp.org/chunked-encryption has the spec, and you can check
> against the implementation in pyca/cryptography or (for Cobblestone-128)
> the Go package filippo.io/cobblestone.  This assumes your CPU has AES
> and GCM instructions; if not, you should see about using one that does
> or work with a cryptographer to standardize an alternative that doesn't
> need them.
> 
> Nonstandard constructions like this one are to be avoided.

The wider problem in crypto without a use case there is nothing
to protect.

> -- 
> Sincerely,
> Demi Marie Obenour (she/her/hers)


Br, Jarkko


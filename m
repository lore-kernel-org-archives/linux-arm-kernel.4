Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D3C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 01:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1r02Sd0h;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IQv06nro
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=49NXjUTbzL4+xbJpcXKoJd4omTTJA3SheYrgPCgGq84=; b=1r02Sd0h3/D/5bVDH8ETA85F4f
	P6Uh/rvePkU9dbrgXrgFjNQ9O6dzzdHtMcPFr7O76mg+DhBG/zuQ2BMeVhlOcI/ZGatfwgIwIyrpa
	BcTx1dKHMOSrAQ0paK4I3cRCnz31NFwnUHLmz7QEpdnOyKpkqZ1xpjtfJRt7I1pUsEUA+2oL9QTf2
	Z/AmlcBfnfmV4QfYup9sJdeRUAp8a3kmNkhP7N2lhibLO7Kvf21Vm/B1sso7ZIhCszMfbNmiFYyal
	2+mI6zbPC2HHOGreySsyvAXTSr2QykWxDCB8nmgNif/6tkVdgnf2H1svAb/RP1vph4ohyp39AROfi
	Kpw+eGEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTqWV-0000000AbqI-26gg;
	Thu, 19 Nov 2026 01:01:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTqWT-0000000Abq9-2Y3p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 01:01:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id E578843726;
	Thu, 19 Nov 2026 01:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3E62E1F000C4;
	Thu, 19 Nov 2026 01:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795050068;
	bh=49NXjUTbzL4+xbJpcXKoJd4omTTJA3SheYrgPCgGq84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IQv06nrofbIqNARVVWh9JrAgHaEyRWKOud9QvOcchO4KY4ScIzXSqs80rNJ/ht3b1
	 Tsu7VMYrIh/2Fi+hRTl7qSSsKz4S7jM8ebpPVfo17lwtEFZMdAvwfZsxatV/ZsWAUp
	 PJgwsXqU+KqK3LvIcvOGucx9P9jANzCFHIamLnf4sC5rVp+bvnrP0sCUChwGa++Hwx
	 a7awEoAOqry4Xom2vSVycaB2NRS9vG06yCTtwmMYjMTvqtDoBc6hHSkU5Dk5pOb1Ih
	 GIaqltmVlM6m491tKp84gsZmgrtTNr8xvyupIzrYmeeJ//m5Bn5hJKwuAsDqwP+LxE
	 +hNKrozwFIXmA==
Date: Thu, 19 Nov 2026 03:01:05 +0200
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
Subject: Re: [RFC PATCH 0/9] KEYS: keycrypt: keys that user space can use but
 never read
Message-ID: <av5KUakRYdiaondn@kernel.org>
References: <20261118140421.584086-1-giometti@enneenne.com>
 <650f89ef-9745-4f75-b254-80fa5ac4773d@gmail.com>
 <av5EyVHnNzT27dyK@kernel.org>
 <61ca7c37-7b42-48a3-be2e-95deb4d999a2@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61ca7c37-7b42-48a3-be2e-95deb4d999a2@gmail.com>
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

On Wed, Nov 18, 2026 at 07:43:37PM -0500, Demi Marie Obenour wrote:
> On 11/18/26 7:37 PM, Jarkko Sakkinen wrote:
> > On Wed, Nov 18, 2026 at 06:42:15PM -0500, Demi Marie Obenour wrote:
> >> On 11/18/26 9:04 AM, Rodolfo Giometti wrote:
> >>> This RFC proposes a key type, "keycrypt", whose material user space can
> >>> use for symmetric operations but never read: AES-256-CBC, HMAC-SHA256
> >>> and an authenticated AES-256-GCM stream, through a file descriptor that
> >>> KEYCTL_CRYPT_OPEN returns for one key and one operation.
> >>
> >> I haven't looked at the API, but from a cryptographic perspective,
> >> this encourages very poor practices.  AES-GCM even allows userspace
> >> to extract the secret authentication key.
> >>
> >> AES-256-CBC isn't a suitable mode on its own, unless it's combined
> >> with a MAC in encrypt-then-MAC.  Even then, it has a 2^64 birthday
> >> bound, so it should only be used 2^48 times with a single key unless
> >> the key is ephemeral.
> >>
> >> AES-GCM is not a suitable algorithm either.  If you allow encrypting
> >> with a key loaded from persistent storage, there is no way for the API
> >> to ensure it is only used with a unique nonce.  Nonce reuse leaks the
> >> authentication key and allows forgeries.  Using random nonces isn't
> >> good enough either: NIST only allows 2^32 encryptions in this case,
> >> and the API can't enforce that limit.
> >>
> >> For long-term keys, all of the following are much safer choices.
> >> They have 192-bit nonces, which means that one can generate them
> >> at random for each encryption without any problems.
> >>
> >> - XAES-256-GCM
> >> - XChaCha20-Poly1305
> >> - AEGIS-256
> >>
> >> AES-GCM-SIV is also okay, provided that you are fine with occasionally
> >> leaking if two plaintexts are equal.  This happens whenever there is
> >> a nonce collision, so with probability 2^-32 after 2^32 encryptions.
> > 
> > The exitential problem here is that KEYCTL_CRYPT_OPEN creates a circular
> > relationship between the keyrings API and a specific key type.
> > 
> > At hardware level I did not see any support for TPM, which narrows down
> > the potential user base.
> > 
> > The remaining potential user base is further reduced by those that use
> > trusted keys; leaving out those who need to solve the assumed problem
> > that only this patch set can presumebly sort out.
> > 
> > And we don't really know at this point that cut. This is pretty much
> > the break down of what is wrong here.
> > 
> > If there is/was a problem to sort out, it should be so constrained that
> > it should be as quick to describe as stepping over a nail really.
> > 
> > These are the main topics what I would focus on.
> 
> This whole patchset looks like a solution looking for a problem.
> 
> The usual solution to something like this is a userspace service
> like ssh-agent.  Then you can do whatever key management you want.
> That doesn't protect against root, but if someone can get root you
> have bigger problems.

This is true. Even if the code was like it is BUT it had a clear
motivation, I would likely suggest to the author how to resolve the
problem more properly.

I.e. bar is not too high in initial code quality but it is steep
from the get go in the "utility value".

> -- 
> Sincerely,
> Demi Marie Obenour (she/her/hers)


Br, Jarkko


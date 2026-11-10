Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A5960A2606
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 11:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IoSssXq7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKRMG1+P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/JeUA5XPTGoy/KR5mIq1snlQu7zsd7kO4TAs7obddKQ=; b=IoSssXq7T+YLIt
	W8ZbPQHdAprkospHk3fCV78eA3oXavryHGNOPOUx26WBCh9LDhPV19N/XIkikCtHnz4Bt0VearLuQ
	seYjfNz3+SURBfB7MZzG/VH+WdVXltwhiA4RzmUH04sbvjS+PjqH/xDFuDMUEDTSrqmD3rDFPtuMm
	wBB6Hd5BbvD/cw4RYlEmN8GcNTKCmtdiQN7k6AH4U0JGvKjGaZK8/K5RDWjG9U2MDVUNC8vNkl72E
	OBv1poJiFqawmkqZN+ToA09ad/B1YWhQJ1roPAyV2YBsJ0tlPTFvcxZp2NR3aXJt4QueRt4lhliDb
	ajYit9JC7Hx13tYBigQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjzu-00000003cwn-1oiJ;
	Tue, 10 Nov 2026 11:26:42 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjzq-00000003cvf-2vF3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 11:26:40 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-8b335ef6441so15859627b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:26:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794309997; cv=none;
        d=google.com; s=arc-20260327;
        b=G71/m1AxPEpihUvUfOIa5NK0JE36mk6hvcVE4v1MPNTNReqlwm1c0+lRi4+dYV+/Xe
         wsK6NEK5kJQ07xT0eyuKdilCtATcNQE1mVmJaJyXdO4tlO8QUTOUl2bTv16kxwXpEUZ9
         BJcKQ4AwD4lQfCyVrBDajK/nMNExzCqVl8IUI/8p9fOgg3TDbhiAfWR/JiD7jt+dsxYM
         wUhAjBB352kkLQLwG05MixjbZKlTL4TrSveSUcbbBNw1PwYr5SDn3r1+hc0Vruw2l4XR
         WGmJVCO4ZAmMe5NXdStYoQ5A3zpdWs3lcJwV0PdC3btP0KEeWmPXEQlGb1L0LTzGLZ5w
         m02g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/JeUA5XPTGoy/KR5mIq1snlQu7zsd7kO4TAs7obddKQ=;
        fh=yi50jhW81sArRH/e2/Qqd9xKBsct8ZLyI00CvMkw8HA=;
        b=qSu//5J/9BSiyv+M5BIOQN1Bhl3aDURc6VpmYQgjcOIUikxa+52CA8j+a6R2VQHkcC
         k70+BuY3xoTkBT9w9WTJlOSfw1XWzH/yKDh6/21FjmjGfsLyuNuV1Hv6kO65GvpqGy95
         +Etgyp7rLEt7ZeqnfY/U4H64WJ4qmflHA30Syuo4cqWYHEyzr0YxlSTxgvjzGs0UpGmo
         Ems4/FxmoCptyYzG0XgBZprfvkpy7zleRb1QfoEKFI7tN3jO2Ks6CJ+pWWJwV/2Jt1AH
         DNa1QDfWww6JLv3KIT+3YCzaqumrq3jCu0TZFuwBOLNkMwUI1HWMUWrXD70mH+8EGHkW
         Ra1Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794309997; x=1794914797; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/JeUA5XPTGoy/KR5mIq1snlQu7zsd7kO4TAs7obddKQ=;
        b=HKRMG1+PGdtqIk3/6y8mygGyfnWjrAVx0+67GjnBQt5UFsAuCMyuAMLKWg6L1Fpzfz
         935ptYiiNmt/Rsm3JU67R+P5ySqosbXMhBtFTeWC2zFU+0/fJ/CS8eKSc5CvM9NZ1vNH
         JsxQ70kc8M69WEqqseKSsGfeQZWPQ9bf9OygLZe2F0lhJ2caKKK+F/5t9BCy2TteXpfH
         ojhLnU7EgOgF5pLlem22tKXpU33f8eqX7GmwoZ8ECbGjdMljvFsX3l+bUvglzu3ByJyc
         j11mPx3hnmqbLoRxPPkDJ7F8IqZxW0Ous8J9gzLTerqKT+GoxfNe/BFNNlg2IFkKIya6
         hAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309997; x=1794914797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/JeUA5XPTGoy/KR5mIq1snlQu7zsd7kO4TAs7obddKQ=;
        b=1MNbkKSuRPYIICpBzHGWaknPE7Ekq0PdLGcd5GiwGKTUZupZOs4OQNulIiime9w0mY
         7fmOgUkz7Km8bzd58yEy7nEMb5mFymKKCB18HX1/b/cPFaQ9h0UqAOoXupcKXM3SNfEJ
         SoKfCWwfl5X6VLBp1rN+T9HIE/EF334BHygTZ8YhNvzOyO00pepB2WcDLrifu4K/LMEt
         irPzRhfWsXMjfQYVQMyi+hPjkEKOeqAs4/YMLsvqnbpMLsoQUyTaPsEmzvGotkAU0eep
         qdZDJU1BraBOhEhBEQF59/5WJNcqUKH/ft3YB9vEGnN1mlRAGwEhhlyxiPM41cjS1tUZ
         aWqA==
X-Forwarded-Encrypted: i=1; AL+hErG/T09ezdq/mw0qTfqwOSL7jKEYc0U+k0jfPFi6zkjyr/Ed2DQkkH9/vUvxgEMHNtBB82O3GcUxPRr9g/iWUpl7@lists.infradead.org
X-Gm-Message-State: APuU4Z99kPdZiwzzKIxgJAzoBx1K31D+yRG6eFr6y0cgfIx0RqoR+eGH
	XRhrJDAxHQO4ZwtSjkZEeXsCHpeZ96fqsoO3Wyyxq1KnYD1Lq7GSev41yOIYu0JAhPMOHE+ELAJ
	FMPRf0dVO1PcEh9vEsRBTB6/2YdRdXmM=
X-Gm-Gg: AYBFou0/jaFt5JzRoVNs7JWg4z5jABQmr/jRc0X3B+WOorm7oFrtfRaLyQN+37YatI4
	8i7L+pspbIaciRQ6pASCWSBN6hMXQc4p5/0blnE1boXt5qUso7ytyRZNmZnAHsiTqSh63PQj1dt
	oWiJJz+Izf26Shw0ZTMPB71uEInJHq6BF1mrFgSy2yynCzqzeYX3UdGr08rrh2Q9iz45XH3vFhU
	4xKgXk0UdUlY2YY4Rkc/7ntp2HVV3Vbk7+r5HnNF/nSTH6be8oQWHxAzJgcB6oHcaqOBOMopoR+
	G/NnIMkhOzs3CS5Y1X3QscbAwvZWVMyCy1mkqbYKm/26v/GCqSXEjnEC6srNrfCzonA/XUnxt1L
	Apm1uFyYLnE7c6QWSqk3wruIMhl7fr5Z4CePirWRwuDHZY4XhGN+qD+rQku3UiNx99T+wlOBULD
	ewC71A1BvUIYk6SnRFIWvn24g3r+V7gPT9ybmv1kUo/YzmEXs=
X-Received: by 2002:a05:690e:4506:10b0:67b:e544:7adf with SMTP id
 956f58d0204a3-67c567cb670mr755726d50.104.1794309997113; Tue, 10 Nov 2026
 03:26:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
 <20261108-b4-apple-mtp-keyboard-v5-2-e2c97b82669a@gmail.com> <20261110-accurate-unselfish-cockle-3a39bd@quoll>
In-Reply-To: <20261110-accurate-unselfish-cockle-3a39bd@quoll>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Tue, 10 Nov 2026 22:26:25 +1100
X-Gm-Features: AclHuK-5Sr8Vu0dogwKG9EMBtjFYwuxFFj20UBqhmDk8dxo-p_0NSr8q2RJWh1g
Message-ID: <CANpmGNufv4_PM=1D1E-KRNQOuCPj8k+sGUJ1Y2HkkAtoSuL0Ow@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: input: apple: Add DockChannel HID transport
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_032638_743575_8BF35D7F 
X-CRM114-Status: GOOD (  20.31  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 8:20=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> Just an enum instead of items and const below.

Thanks, will do in next version.

> > +  apple,has-stm:
> > +    type: boolean
> > +    description:
> > +      Specifies that the coprocessor provides STM device and serial
> > +      number query endpoints that must be ready before registering HID=
 devices.
>
> Isn't this implied by the compatible?
>

No, it isn't, because whether there's an STM or not is decided by the
type of trackpad
used, not the SoC or even the MTP coprocessor itself. My wording in
the description
wasn't great and I will make that clearer in v6.

Rob suggested apple,has-stm as feedback on v4[1], we used to have it
as a separate
empty node.

Right now, as a heuristic SoC works because the only device to have the "ch=
eap"
trackpad (and thus no STM) is the MacBook Neo, which is the only
device with A18 Pro.

But that isn't guaranteed to be the same in future. I don't think it's
right to base STM
presence off something which actually isn't the actual determinant,
and just a byproduct.

> > +
> > +  hid-country-code:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      HID country code for the keyboard layout variant.
>
> What is the meaning of values? Do they map to any existing ABI? Like USB
> HID? Otherwise, why country code is 32 bit integer instead of ISO3166
> codes? As pointed last time, this should go probably to a common hid
> schema.

It is USB HID country code. I will specify that in the description in
next version.

Would you like me to add it to
Documentation/devicetree/bindings/input/input.yaml,
or make a new hid.yaml in that same folder?

>
> No default? Not required?
>

I will make it have a default of 0 in v6, so that way it can be
omitted by the Linux
DT. The intention is that the bootloader fills/adds it.

> > +            hid-country-code =3D <0>;
>
> Which country is 0? Isn't this just a default?
>

It is "Not Localized". As said above I will make this the default in v6.

Thanks,
Michael

[1] https://lore.kernel.org/asahi/20260925-apple-mtp-keyboard-final-v4-0-30=
4c267518f4@gmail.com/T/#mc53edc016ef1484c18e217b941b927bbf86f2cea


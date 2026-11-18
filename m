Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5B3606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 09:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kwKkm3hB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q+CVL4IY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TMv19XzBydjO5aL38YU2E7OmGv6/GTdijnJuqThzR4E=; b=kwKkm3hBWujfot
	s42wCUuB3KbHx9/1Nfy1meGlmssOJPFv1ZrR+/ae55QuI5e5xMx7lk+r6haEiRh9jUFMmSpGAB9d5
	Fhn53vqKVRVFuVNMVAeX5Qptg8dcAbd2BBzK5ExUPGhTTt/+Hz9EjDoNk+tgMJDa6oJYm0cSJLeTp
	4gf0MN9iZsNqZUKuIR64ib5MpKKwH0jPmeh92eZqe1xKZp8NbqT/0l7Ti2WuXUQeNWxwZqxLRAAzE
	Lk5J/dffe3ZU8ue8+0oo/jl2tStYGBjIphukQWgeyx8qqOb4yLp5u06Pez6EyxakglD7FLYFVjd5i
	ckwlMKKOZAtT0C+m59hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbZB-00000008HBj-0JcP;
	Wed, 18 Nov 2026 09:02:57 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbZ8-00000008HBD-3LPs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 09:02:56 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4a358881793so305551f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 01:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794992573; x=1795597373; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TMv19XzBydjO5aL38YU2E7OmGv6/GTdijnJuqThzR4E=;
        b=q+CVL4IYVHpFcXd+iN9EbV91Pyb1C+uEPGfvd/Q+LfSJjL4CFaeYmAetWN75wA/Cqw
         P9LLsbrUpz0Zi9On2SHCIzIWHUtl67YxyF3AodDh3tuuCcujOgSCYZpVl+mlssiBRqvG
         7jTUAFUfP7yupkXkPeLjLrxQqxAEEoLLR5p4ps1cCaJadv/egxtJZVMM7s8daxV1DJCq
         YyMh4sOjLPXYcappt5aoGDwtErKchpulX2xG1IB8DhxiBqeq5XpCdvZpYT98PKUGh7X5
         BlbmfPLiprVdPS6Rg6qz9c+T9yiOva3tlES6/ySILuZ69uiaxR91r+FDv/cYZz5H4RU0
         mtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992573; x=1795597373;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMv19XzBydjO5aL38YU2E7OmGv6/GTdijnJuqThzR4E=;
        b=CzFXZ2mEdYjmgOcku+F09AJhTq9AC6wewbN4MtsekY5I4B5+auq9kJsEYwJJIZxh+0
         FY9TBiGLCGvY5R91MJw5HiBbN2J5KNsDmJQGQn23Lzv1xnjJ41eaC22Dms8DVMsrugT/
         abMAEM2PDbabnLTB4OZnddP295MhsVOjsmwdnj3FOMR1lN29KV/FtPBke+onLH7rD7ir
         vrYYC3/bKRfgdIehItHZl/NlZIiYdKcRifHyg+YaeF6ht7uEECHQGjAbUSoHlxzVUsrf
         bR4lGTLqBmRKXJoJpiDBsLss1qtDL57ayOyYSHGFFpGXFP30+iq7nAXlVSnjQBpXKstW
         1okQ==
X-Forwarded-Encrypted: i=1; AL+hErFb+dHMhYGtvxSbVHFmtWX6nlMjJWhmwHNojIm33zkRze+HhMfc15Nso3bTD3ZVRRpiWJ9pwch2gGVO9aRQanuM@lists.infradead.org
X-Gm-Message-State: APuU4Z+RmROmIfLezuIhzDd+y67zczpKHQCMys6O7e9rY1jgJLx0sn6p
	NhzuDDLWnTQm0yq4tXBpigYeiqyBNMhilWl1momLny9gCR0aXWsAoDBz
X-Gm-Gg: AZFdTZdM6V+RzLFLhjeWD90nLW9v3MVegetMDW2P9EJlIao4hu2v86jpGpfAejvTbHk
	HDUE/dClVbarBDrvKZQVH3JESBjVES28YJne53O1h015cgvbU/wDTYrgzD0Jpivi0L1aaYzdPxf
	CP4WOCYvvfzqSaqYPynv+tR1j5PWnnOqFXBEAEexvXzXkh9v/lhsExhKFMs7VMWl6aohQSily1G
	8wZ4UZNN7zx8XrzlmeZeMrsB4w0r4Wy4ixnY2xigtwGiZJHcL8p+tEjFEC9qy/5FAlY1BHeC5Jt
	QNER4+JgqqINWd0hciia5m1XRVzZfwIvF72mtb/GBd/kXH3YV9OhZvEHsaitZ/OarEQwsIeYK2a
	xzt+bLALAIPY4xzlRPnIQ52VhtB4qkuX11yHC0AoS55nwEy5jzomsX4Xy1iGIwRncVHqw0Qd1/M
	MhsKYLcLjB5q147/Jcsh4bVbFYYQo0aMYXVkH06iT2xrUKuKWikcjWzvSTetwdPt/XIn3uso+62
	vfwc8AOM2UjjFa3H1nG4KCuGBDr81vBUwGN8GC3mSUcgb8ndKvVC3yqeK3H3dilW8d8Obrb7TNy
	MLXWt9WhuJqk2K9BwuM9BXeR4ZxUU5a3QxPYGG7jSQ9fPsHZkVp+ejeGqt07atA8Zg==
X-Received: by 2002:a05:6000:4812:b0:492:a72:9303 with SMTP id ffacd0b85a97d-4a63b9d9635mr3815055f8f.22.1794992572498;
        Wed, 18 Nov 2026 01:02:52 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm3475452f8f.18.2026.11.18.01.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:02:51 -0800 (PST)
Date: Wed, 18 Nov 2026 09:02:50 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Linus Walleij <linusw@kernel.org>, Michal Simek <michal.simek@amd.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, saikrishna12468@gmail.com, git@amd.com
Subject: Re: [PATCH] pinctrl: zynqmp: Ensure function names are NUL
 terminated
Message-ID: <20261118090250.2ae9258f@pumpkin>
In-Reply-To: <85ff5be0-4fad-4d92-b9f3-2553c7c4365b@amd.com>
References: <20261117073947.1100444-1-sai.krishna.potthuri@amd.com>
	<20261117131616.0a631d5c@pumpkin>
	<85ff5be0-4fad-4d92-b9f3-2553c7c4365b@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_010254_860717_47E91B37 
X-CRM114-Status: GOOD (  27.31  )
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 14:08:16 +0530
Sai Krishna Potthuri <sai.krishna.potthuri@amd.com> wrote:

> Hi David,
> 
> On 11/17/2026 6:46 PM, David Laight wrote:
> > On Tue, 17 Nov 2026 13:09:47 +0530
> > Sai Krishna Potthuri <sai.krishna.potthuri@amd.com> wrote:
> >   
> >> PM_QID_PINCTRL_GET_FUNCTION_NAME returns the function name in a fixed
> >> 16-byte field and does not guarantee NUL termination. A 16-character
> >> name fills the entire field.
> >> The driver copies this field into a 16-byte buffer and subsequently
> >> uses it as a C string. For a non-NUL-terminated name, string operations
> >> can read past the end of the buffer into the adjacent groups pointer.
> >>
> >> Reserve an extra byte for the NUL terminator and explicitly terminate
> >> the copied function name.
> >>
> >> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> >> ---
> >>   drivers/pinctrl/pinctrl-zynqmp.c | 7 ++++++-
> >>   1 file changed, 6 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
> >> index aba129ead04c..c778133fadc2 100644
> >> --- a/drivers/pinctrl/pinctrl-zynqmp.c
> >> +++ b/drivers/pinctrl/pinctrl-zynqmp.c
> >> @@ -29,7 +29,11 @@
> >>   
> >>   #define ZYNQMP_PIN_PREFIX			"MIO"
> >>   #define PINCTRL_GET_FUNC_NAME_RESP_LEN		16
> >> -#define MAX_FUNC_NAME_LEN			16
> >> +/*
> >> + * Firmware returns the name in a fixed-size field and does not guarantee a
> >> + * NUL terminator. Keep one extra byte for the NUL terminator.
> >> + */
> >> +#define MAX_FUNC_NAME_LEN			(PINCTRL_GET_FUNC_NAME_RESP_LEN + 1)
> >>   #define MAX_GROUP_PIN				50
> >>   #define MAX_PIN_GROUPS				50
> >>   #define END_OF_FUNCTIONS			"END_OF_FUNCTIONS"
> >> @@ -650,6 +654,7 @@ static void zynqmp_pinctrl_get_function_name(u32 fid, char *name)
> >>   	 */
> >>   	zynqmp_pm_query_data(qdata, payload);
> >>   	memcpy(name, payload, PINCTRL_GET_FUNC_NAME_RESP_LEN);
> >> +	name[PINCTRL_GET_FUNC_NAME_RESP_LEN] = '\0';  
> > 
> > Too many constants....
> > You might want to try embedding 'name' in a structure.
> > 
> > Then, at least, you can use sizeof().  
> Ok, i will define the below structure
> 
> struct zynqmp_func_name {
>         char name[ZYNQMP_FUNC_NAME_LEN];
>         char nul;
> };

I'd try getting rid of NAME_LEN and just define the array as size
RESP_LEN + 1.

David

> 
> and initialize them as below.
> 
> memcpy(fname->name, payload, sizeof(fname->name));
> fname->nul = '\0';
> 
> Regards
> Sai Krishna
> 
> > 
> > David
> > 
> >   
> >>   }
> >>   
> >>   static int zynqmp_pinctrl_get_num_functions(unsigned int *nfuncs)  
> >   
> 



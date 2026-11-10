Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0220606A9C0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 14:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vd9LXjpe;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Xntelpv5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Vbv4D0/LEv4X185FkFGCxxtMC7jQyoiuqvpgmuYpp78=; b=vd9LXjpeewII/O
	/B7k7OYR8JhgZP3hjcnPUu/5mD1PgBfQSc2Nvbb6RXg1HC64Lfd71E7OkjMyp4ufwa9ieT6vqOqE9
	apcEt/avJnFyOuJvgJzQ8A0vSAHcqBJXyijrCiAjTR65WBuZ2Ez/hldCbymRRtAxPLfpGC82+/9OL
	1nxUJOyE20r1bizYtIk1ea36BptdY1VRucXV17UK73M+VgYHK3fo/YPHxzcYf4EbdS/tfr5jn1308
	GwlGrIickgCxgavpboI1I5Xg6NCS1KynrNnzXBYi1APdjoR1TqwQ1U9/APwRa43UjS0e2afXv4eY0
	GpPCal7jvoVsb1VC1N5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQn56-00000004FqZ-0iJM;
	Tue, 10 Nov 2026 14:44:16 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQn53-00000004Fpi-3WCt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 14:44:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1797527f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 06:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794321851; x=1794926651; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vbv4D0/LEv4X185FkFGCxxtMC7jQyoiuqvpgmuYpp78=;
        b=Xntelpv5dW1MWJwBTnuKhR1OvQFz0pcHOcczGi+lPU6U3Cdy2/zfmB3tBDbd4Snu3b
         0r0v2HkRodnETOg1KrPLvRC3dvN/tlVlMIQ8xl5QQIpL7CA+CeKeUTqEOD5ZSOtteXMz
         sAupwphQXdLVFyGUrHCKt7mRtbplJPm73Pj6L1QJbLIoZGk6QgBpaiqX+9O3AJvrNP2j
         EHBPmxgNF5GZ6xp49ag202HDzSbF9gpB1S1tozJ25c0ymS60vF/ILDMFSxyao5dIGCfE
         5H7AdemlRFfKgen/OoxtLSWv26XBO/L8NBgSye+tQXSEPlXJ7iZqT0fSnD5p6G6NBc+I
         CorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321851; x=1794926651;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vbv4D0/LEv4X185FkFGCxxtMC7jQyoiuqvpgmuYpp78=;
        b=E29xXgDPH9RG9EaTezUVyZs4kE5yl9BaZM0/uRDxf2E9WbS/Zd+Emz6pZq9jCTCdO3
         dLAkoMtKGB+dT9Gz6EgLCunW2rq/cSR0G+/6fZMSvVDwDESeveGWhAAmJTKl33YW/8zq
         X0Zu1BdpcgLfvDfB1AFpDX+apGDiw4nAEO1mWh3FSCN30F9M2UjXbyta5HxuVEtWAzn2
         0qmpHqhsAk/ufzBB2d+3MXpQFI8KNnYIOCtAc4Don6U4xEPSwbhXNXbNFBx+7ot7EPPV
         TJmvG0GRIFt0BhuXRxAxqBTrr2p2EFDxsHEB2q9Fz5eYEG0oWzHzFA9HPTqOsJkO+HMS
         IkoA==
X-Forwarded-Encrypted: i=1; AL+hErEHMeAkN/GlEvZ7pjlkvWVAIpaI4WF7q4S/0INqNMCDCw4fVW4ZFYUbbJDl2RV+XfRo1DTBlC1HObeFS2yi5ewm@lists.infradead.org
X-Gm-Message-State: APuU4Z9Oc2Bvlf1WsbXBvI+hEWCgWr2QJ8PDgmjvTNXp+y1W3J7byRxv
	rAcR+5LZBVPNNisgxwHdIqOuyOJ5bxIWxkjXNad5KQRXJo9E+GWEXwFIZ8UqO8wrLJ4=
X-Gm-Gg: AYBFou2rkh0IQGmF8qGN9rZhVqL1wcULjHQmExK3FfsYL2axzBJxk1xEL4gveJeqZcp
	7FQ5ksXdacSsHJ6Vuymo8OHZd8PaWynwRW1dQvoPMsCGbvnu13VXR7MG3seNOujLtDazcjrVdoG
	AuUy7fzZTHnC79VmoQx7YfAQGn6jTaPEUuHRECT39ih1GUpPSSmluKYyWuT995sAh/A+4mNTDeW
	z2y3oGuOD7XoYWZDxFQqWUX2DcjFAHelfy4aftGlU0Lhpri3xz7o49UKElNhcfoyx5s9EXziPDQ
	vxP/ZWaH5eardWl744VXTxROgV4mdTJb18i6xxgQc+RTkQ1/3UH9fS8PQUlOJ1hqtJ8Q87FLxxq
	CH83jfg8LLA0mxz2T29RwXFgLRMAz3ksVLEMS3GHwKn2y1ZFASgWTvRZRMpvJaj4BsYLmQcQiae
	UQlrUzig+wKEoXjTxqPYeMHaTUb1/t2XRrdeN6Zaq9w0tN3nXL4/LJhq4L4RF7LQzei40ZO2+Jf
	Fg0EoiDvpTrT52a1EpHED4feo7CUgkD+Gb3AVLHbtPMi3kMazEbJ/hatq86wV8ExuIWy0rVYT48
	CTY91mJl1EHSktjffVd9F6GDzVk6h/wGs6mzhBRhkzgGHCb89xEs2LzwpA==
X-Received: by 2002:a05:6000:46da:b0:48b:e50:714e with SMTP id ffacd0b85a97d-498308b95a4mr3820299f8f.36.1794321851164;
        Tue, 10 Nov 2026 06:44:11 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2c027sm5439242f8f.24.2026.11.10.06.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:44:10 -0800 (PST)
Message-ID: <9ab69228-a9f7-442b-9a2a-2e012f37668e@baylibre.com>
Date: Tue, 10 Nov 2026 15:44:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] firmware: arm_scmi: stop reading past
 PINCTRL_LIST_ASSOCIATIONS replies
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-5-52d92843ad97@baylibre.com>
 <avLxpUd6cXuqUCbd@pluto>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <avLxpUd6cXuqUCbd@pluto>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_064413_907469_0FBC4CD8 
X-CRM114-Status: GOOD (  31.63  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Cristian,

On 11/10/26 11:27 AM, Cristian Marussi wrote:
> On Fri, Oct 30, 2026 at 04:58:36PM +0100, Clément Le Goffic wrote:
>> The transport cuts a reply larger than the receive buffer, but the iterator
>> still reads every identifier the reply announces. Use only the identifiers
>> that were copied and ask again for the others.
> 
> Hi Clement,
> 
> thanks for these fixes...I'll start from this since it really intersects
> my current work....
> 
>>
>> Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
>> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
>> ---
>>  drivers/firmware/arm_scmi/pinctrl.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
>> index 42cb1aef1fe1..69645ce73d9d 100644
>> --- a/drivers/firmware/arm_scmi/pinctrl.c
>> +++ b/drivers/firmware/arm_scmi/pinctrl.c
>> @@ -261,10 +261,22 @@ static int iter_pinctrl_assoc_update_state(struct scmi_iterator_state *st,
>>  					   const void *response, void *priv)
>>  {
>>  	const struct scmi_resp_pinctrl_list_assoc *r = response;
>> +	unsigned int nr_fit = 0;
>>  
>>  	st->num_returned = RETURNED(r->flags);
>>  	st->num_remaining = REMAINING(r->flags);
>>  
>> +	if (st->rx_len > sizeof(*r))
>> +		nr_fit = (st->rx_len - sizeof(*r)) / sizeof(r->array[0]);
> 
> As Sashiko kindly pointed out to me a few other zillion times O_o in my
> Telemetry series, there were a couple of missing sanity checks in the
> iterators core so in my last series there is upfront a generic fix
> 
> https://lore.kernel.org/arm-scmi/avLTkAtQQSzpgu2A@pluto/T/#me258191dd55db99d53b570be7c51901c31bc70cf
> 
> ...so we could at least avoid to check here and everywhere else in SCMI
> iterators that you have at least a minimum size messages to work on.
> 
>> +
>> +	if (st->num_returned > nr_fit) {
>> +		if (!nr_fit)
>> +			return -EPROTO;
> 
> My core fix above will discard the iteration upfront in an equivalent way
> to this check togateher with the rx_len check above If I get this wrong...BUT..

Right, v2 keeps only your check below

> 
>> +
>> +		st->num_remaining += st->num_returned - nr_fit;
>> +		st->num_returned = nr_fit;
> 
> ...why are you fixing and carry on ?
> I dont feel that you can safely proceed at this point by just fixing the
> returned and the remaining...

Each request carries the index to restart from, so it stays in sync but it hides the DT misconfiguration

> 
> ...the check is of course needed, but it should be an hard check
> 
> 	if (st->rx_len < (sizeof(*r) + sizeof(r->array[0]) * st->num_returned))
>                 return -EINVAL;
> 
> ...because something is clearly wrong...indeed, learning from my current
> telemetry madness the above scenario could be due not only to a buggy FW
> BUT more easily to a misconfigured transport...if the transport size is
> misconfigured (as it is mostly NOT negotiated, simply configured) any
> message long enough will be silently truncated, so the fact especially
> that you guess remaining it can happen to be completely out of sync with
> the platform side...

I've seen your serie but didn't check such details. I'll use this hard check in the v2.

> 
> Are you fixing an existent known FW bug here ? in that case I would opt
> for a quirk...

No firmware bug, just the DT that had no arm,max-msg-size. Linux was using its default value that was not sync with my SCMI server value.
Setting it fixed it, no quirk needed.

Best regards,
Clément



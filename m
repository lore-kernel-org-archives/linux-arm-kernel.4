Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4261606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zz1ctQW+;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=atu/1LpS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZQvS7z6b0AGal/0iSKLTcxhwhRK+gpszSACJINCNrvk=; b=zz1ctQW+4ulXPA
	IWVjgQh+NWHsVxzdlZ8noV9+VafbHG74Rl3Jv5enS6ztpf0NeOTqGQ248aPxNLOFe7/NBGX1ju33T
	9/f281kw/pF+eYTUbuIBx82HvHOHMTc3LUJekJ/VgbHkKMNTmg6zkfm++qNXzNEbps8zL+D2ST2DI
	RCKJ/zYR1bImDTZbkGxXVFN39UuGvvtNTjXRqM5GywE5aDSqZFcG2WVM8x1RrmhUPN+q4c8xP1Jdn
	LiwIms7Pb848WWd2C914HMdSoEH+EVnP1OgF+R/CWPBgb8uVziQrUWoSDwFMn+pjXa63xLu1znWGG
	ROFNzwZL3J7jLdHt5sFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVWg-00000003sUP-1U87;
	Mon, 23 Nov 2026 15:00:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVVW-00000003rxC-0Ocp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795445933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZQvS7z6b0AGal/0iSKLTcxhwhRK+gpszSACJINCNrvk=;
	b=atu/1LpSsZ5DY22wd8a7wek+seQzxygmTX8bc8WAfDzysX0nwc6ePCxMsaiNX2MUINw8XJ
	As+Xwu/2ME1xw0j4z20Nne3FmjMJrXPJ+MwSiPuQn+caEcwxR+EPjc+ULI8O1qf+w+Kt4H
	BUDj7YumpwZmDJyvRzzDz5NKTlT4dl0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-DuEKfpT8O6OLoZ4XXbLOPw-1; Mon, 23 Nov 2026 14:58:39 +0000
X-MC-Unique: DuEKfpT8O6OLoZ4XXbLOPw-1
X-Mimecast-MFC-AGG-ID: DuEKfpT8O6OLoZ4XXbLOPw_1795445913
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4a799d93bc3so1597495f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:58:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445913; x=1796050713;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQvS7z6b0AGal/0iSKLTcxhwhRK+gpszSACJINCNrvk=;
        b=egVQ00M28D4ag4hv/HTr8FqS120mVbSHpurWW3D8nToQWHVb/1SPkC5x1yDSNmB4x1
         XdzR6y/XbhJyzOXpdb8/iVagIqLyscEx+BVh3fAhYdVLUJ/qGEc/rMIW6xyImUZ5ElR2
         s7hXiffv7I4GORpj3RMpEXNzPDFlUZGpRbCC5Dvyn/X+I5gSZ1VGdWB83mlgI76/gesP
         SgpILnSMLD5pQYxN2EFTRNPvoi2c4qV9dGg2E9MfWWUDbClcCJqn9shvxqWGmTb61KTa
         M5+fG5ffzo/AaRzSJ1vTmyntwM0YJx5AlXP8AlYCgStRk/a0iQ30P076CiAzssC0gmw/
         1Q2A==
X-Forwarded-Encrypted: i=1; AL+hErGVHnEc5XatezxRzjYrwkEkzC3MCvqzIXpD+YGUjpp2LyZ2VQXX/RhJda8MVLg9RbvUnIxpIVSoWiQsXLLGNYz+@lists.infradead.org
X-Gm-Message-State: APuU4Z/T/VLjZXbYkz2Kqbz3lHQJ7VQ8JpvgR4mExl9qxMaPyqm2Yaqm
	+ydVSSRcScJImZyO+/478pC9b0cts5zyeDf1ZcOqVbu0Ew4iTg0YYvYbMLTVzT4SQMji8YlG9EA
	OW8JNTOwKQwl6zL/MfnW4UBoORsXfFv6urWDHY7eScLL1iM4xrxlLBYxh2mRO9vT2UD3iRAYreO
	Rc
X-Gm-Gg: AZFdTZcY+ivdy2n8lL4aeyVm1U83bo97vUjNmIcgUjn/r6PFEN/4Y1e4jUn9Uw7KC/E
	ckqzeCJ/jRs2xyAFd0GXJzvck/2zp5iWvV7/9zsOPkwKsk5pnXvPkJXGzPicDTG8kkKBwYoQYqC
	qW4yqlVbqqSrOvQiD2dKWgT/Er3oEiY0qsX8B6BuaeUbArZ+6onv5P6ZhQfKy5Tv0hve23L/qKx
	/rEnBzblkYvwrdrN90tnScew7AEkUgnnWzwG8GZ3XYjZmPRdUWClY+1aO+5u+G7YKHcab6HSGLt
	iJ9AMYtGse1xnzunmRy1igeTIxbakujF7uWTJJ7gvfUJNWsPuejB5V3TC2Ls3jkIqABuebI2Gc7
	4C/konmYNtbrjeL227ageoe2tDqpffvsNonjrjUpVPcgS03eugJoTWW4nGW6msEBAxFv/3Peky/
	GDkUXsC67gIbJ0578ADIGPuWsJVDBlZFVGq+RO2+3i7bXz
X-Received: by 2002:a05:600c:1c1b:b0:4bb:87be:c138 with SMTP id 5b1f17b1804b1-4bb8893e021mr266098415e9.32.1795445912673;
        Mon, 23 Nov 2026 06:58:32 -0800 (PST)
X-Received: by 2002:a05:600c:1c1b:b0:4bb:87be:c138 with SMTP id 5b1f17b1804b1-4bb8893e021mr266098035e9.32.1795445912294;
        Mon, 23 Nov 2026 06:58:32 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c248b75sm23206193f8f.54.2026.11.23.06.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:58:31 -0800 (PST)
Message-ID: <15ef5667-23d6-4c8d-8cb9-ac3853677c81@redhat.com>
Date: Mon, 23 Nov 2026 15:58:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3] net: sparx5: check DT port reg against chip
 port count
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>,
 Daniel Machon <daniel.machon@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, UNGLinuxDriver@microchip.com
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
References: <20261118162156.17688-1-wanghr2026@mail.zgclab.edu.cn>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261118162156.17688-1-wanghr2026@mail.zgclab.edu.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o5t8UfAPBxhSJYmSyilKroTMWHYhT5eid2WDCjXp6kg_1795445913
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065902_279903_6040E8BD 
X-CRM114-Status: GOOD (  15.40  )
X-Spam-Score: -2.8 (--)
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

On 11/19/26 10:46, Haoran Wang wrote:
> From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
> 
> mchp_sparx5_probe() reads the DT ethernet-port 'reg' property into
> portno, which sparx5_create_port() later uses to index the fixed-size
> sparx5->ports[] array:
> 
>      sparx5->ports[config->portno] = spx5_port;
> 
> The value is never validated, so an out-of-range 'reg' (runtime overlay,
> corrupted or attacker-controlled DTB, kexec-supplied or bootloader
> fixed-up DT) turns probe into an out-of-bounds write.
> 
> Skip port nodes with an out-of-range 'reg'.  lan966x_probe_port() has
> the same bounds check but fails probe with -EINVAL; skipping here keeps
> the remaining valid ports working.  The bound is the per-chip port count
> from the match data (sparx5->data->consts->n_ports), so lan969x, which
> shares this probe path and has only 30 ports, is bounded correctly as
> well.
> 
> Found by a scripted scan of of_property_read_u32() call sites used to
> index fixed-size arrays, followed by manual review. Verified at runtime
> on a pristine v7.4-rc2 arm64 QEMU virt machine (inline KASAN,
> CONFIG_SPARX5_SWITCH=m): an out-of-tree module supplies only a
> malicious DT overlay, the unmodified in-tree driver performs the store.
> reg = 15839 yields a KASAN use-after-free, reg = 0x20000000 a wild
> write 4 GiB out (paging oops), and reg = 65 silent in-struct corruption
> with a later NULL oops. With this patch all three are skipped. The PoC
> and full logs are posted in the thread. Not tested on real hardware,
> QEMU virt (cortex-a57) and compile testing only.
> 
> Fixes: f3cad2611a77 ("net: sparx5: add hostmode with phylink support")
> Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
For future memory: please send new revisions in new threads.

Thanks,

Paolo



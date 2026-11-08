Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A31606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 08:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3G0gSKju;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qEl9anL7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=; b=3G0gSKjud6d+9D
	+E4HzjGuQ9FWD7CL7NJbe4w6q7mbn8p3JKTTYw4nVzqopQLZ1luyxfCo7rtTKs59cz9AOM5RE2dRB
	1vkK01fQGEQXbpES3rwlXLnggBBekvh9IfQxGCjVxd1wB3YF0wZAthEr6kccZEOGQf7SAKfnnqU6/
	qrZng4N/LkxKfyHrqqzAqztj/ZkQUICbKbUFZwsxwMj5/tleMVBcb5bm4H4pMNKaznSgKPccVB8Ba
	OdiLDVkZBda0/bxMQY9NjTj62EMZOYDnAddEkv0lJjOMKR4XUmQoA+ngzIWZIIBMijanq7hriaehE
	ndFgAQICpJGxsVxs5JEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPyaa-0000000Fs41-38sQ;
	Sun, 08 Nov 2026 08:49:24 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPyaX-0000000Fs3A-3KD6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 08:49:23 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-36a315ed211so47840eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 00:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794127760; x=1794732560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=qEl9anL7w2vR2ezxx3xDpYGl1rsoLrQ5w1PPkwkuHhGBB6bj90SBTeMyKZiTxPgxBC
         PisySOeOoK1z2jYk0J6mDHsAZzq0e107dzvdkxQR+4hmk5z4pL1pkpS8FmT3b2JwZnwN
         xypOWT7hbYoACdstrDv10ib4fih+dIIIFcexSS+sKv4coc2fGddv9wfkRkzRuN4O0M9R
         M6whRKK89swYjx5NFbjQuVcTWCXjhantzboH2kTST5kzBcVBLDbhW6Gh29ULjS7HrQss
         17RTgERiEUbyy7goXCzw+UYUhY5JKZCatVP6FRpY/4m+l+FTWOh8geZOGA0H4Ggn6ISE
         Pi8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794127760; x=1794732560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=DoMYovS9A5gklNSexF+Si5/zaLUFSK8Pss1VOTNLdHaz+wemTHx2xC4wPZmiVHriNS
         +LU6nbnt1Nf9KYH/gZ/x1ewqrX5V1g5YD9cnCaQhLynddhaiL7V4mepHzfUcA2SAni2U
         qk4cww5Sne5S8GUHuxW5EbZ2MRlyz//nreZ/M7cQhDoUG0MAxHVrffWbI6/s5s61dBMz
         61fCVKC3gYswGTasn3NGHRTCdKGa2/eDtRWfLuTAY26JcHN/mpHPRLvRTtk3i4KDpl7g
         IcOe3/PpnsbfvKIloJg7mLTVOHt1dIfIOxKdNaN5DNNP7iUGTwXbb/TG/e9Ma0d0tdPw
         FT7A==
X-Forwarded-Encrypted: i=1; AL+hErHMkDrJjX0z9utnBriauOrcGQs7J7QVa+JnY8YSs6kRFRaC4HIOU/kfDIhjH4kEzwPUu4yrzgV8I+ydERl4eizv@lists.infradead.org
X-Gm-Message-State: APuU4Z8zAa9TCu5ZTiXYRUAzzbVK1kIDx0ov6aYTUQeNEsQvTRvKQhkn
	8XapGK/XeisoqslWdJ1F7dVCxtaYu+p1SJE833e0QLSMimKndzpf34wW
X-Gm-Gg: AYBFou3k2GYGiI/D+8SURBpnkmxrd8rUlFFXdL401aYEl1+G5i7OxJsVi6ruNYHPVug
	aFimg/dl1w12U20eNfiLFaOQTVSQ5m9IwzTWpPankl10lLy3SwoYyzloVWFuftZG00qtpr0QPbX
	kX14/b0VTqqzKwwc4MIjASFP981YZLSVG5ZeUhHKSQSfd2MdE41L386osY9j1Nc/TuYZSSmCLbn
	2VwggeGi2RsLCXzZ2wgv5kIRt2JIAcPAhkW1LAzkJoyF0M9rIKYBdLvcib9EcbRVXxYBr9G5yWO
	v/rgeU0qlO9gKix3vR9VmDvFLosGpab006l2J4kkoPNd4p5Pm0Votcl6rO79RC7RalVe55VEUSg
	OPbr4aRTC86ZV7w5gEkXgfDdMJ5UYa2arXz8pBAEyGgSOiJtkqGTQ5ekQ8QqyRWpVnWwgrNo6bx
	pz0YoKa8qfuX/I7GLK+qwOWy5ZDQ3+4xtfQXzQSQPYL03361NoWA0Ap/l338Ch89Pnx2cB6hRGb
	kxu24vyyHMFskGQCcKMYN/B8UOdoZ9KIDF8+vlwIW2u+kZYFsq3VJmk9MwemaIyTdpCSs/XuTj8
	/B2YdJ4VpFVMAl3AedOiKJ5li543tizYB6zAoxGLnFt3piVencc=
X-Received: by 2002:a05:693c:20cd:20b0:364:377c:cabe with SMTP id 5a478bee46e88-370f8170360mr5884840eec.24.1794127760230;
        Sun, 08 Nov 2026 00:49:20 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d6088sm4445529eec.25.2026.11.08.00.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:49:19 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: mani@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	bhelgaas@google.com,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	ryder.lee@mediatek.com,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v6] PCI: mediatek: Fix integer truncation and handle oversized resources
Date: Sun,  8 Nov 2026 08:48:21 +0000
Message-ID: <20261108084821.2827-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179389361906.20463.1092137538074974205.b4-ty@b4>
References: <179389361906.20463.1092137538074974205.b4-ty@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_004921_831532_6FA9D4E4 
X-CRM114-Status: UNSURE (   6.58  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,T_SPF_HELO_TEMPERROR,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj


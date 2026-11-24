Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9824E606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zuclOCS1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OCWvpjlA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zEq0v2oKNYWb4P6EHAyM+/7c+KRh4LKSoNP+1xVqrHk=; b=zuclOCS1irogbe
	lWzDsw0Naip+EBr67j23JJpTifM8wydU1CQgkNc/sCB4ytTq4OUDIYs+SVTuRAbEx852mLTVqsc6v
	oCkFLNYgORumEopsLa5T8J0YiWFXnfIzEQfcBLtoFSQEIAGUpeZStVci4+K3CSgxbb94WGUo0Fn/9
	4mhtyORXp/z0syLnM5SYaGVqlHxgzSf2bx2AVMYXN4KXMl1quCItzsj3It6NLhODtBor3TF9+LV80
	ILrYd70UMUlngpzWW8S3RuzVGkoqwW6/VaWtIOkQVVdkWzKbc+bpZ9X6gV0cTd/S6V/NatR1pp7Sm
	/LZCXzHAN+OU3Y+dy3Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtSS-000000077oi-24f7;
	Tue, 24 Nov 2026 16:33:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtSR-000000077oT-3QSa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:33:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4561E40A7A;
	Tue, 24 Nov 2026 16:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9761F000CA;
	Tue, 24 Nov 2026 16:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795538006;
	bh=zEq0v2oKNYWb4P6EHAyM+/7c+KRh4LKSoNP+1xVqrHk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OCWvpjlALgIusraQjBom7IxT4QnG012vZVex48VG6RsRaXrGTIJe4BMmisV34VBEq
	 wreiypBU+LZfsrNMZ+hTsu9r0QVUyVd6P1Dr52fRxWdbliD0p/x6rVns5Tz8TGwcDf
	 Bcc7pppTTuv8Pl9kIywZZ6lMWjgpjrGFTA9xdLvagTEtGWvsBEdN6SzwnjaL/9LO3U
	 ADHJ8XIA3QlL6Q+EcijCCWOpdqIl1W0Z7w6wdpuGBXphcLQ3SQeWfX40RmUL2AD0Z3
	 TMBkqiXyqIy2hf1mChF5koTo0liOK6vPuExdqONQyPsvtqIfW0wC3thOEW9xGf3Fd3
	 OMpuUKV3DjB2g==
From: Brian Masney <masneyb@kernel.org>
To: linusw@kernel.org, Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@kernel.org>
In-Reply-To: <1795076093787-3-ba1f065a@mail.zgclab.edu.cn>
References: <1795076093787-3-ba1f065a@mail.zgclab.edu.cn>
Subject: Re: [PATCH] clk: versatile-icst: release regmap on registration
 failure
Message-Id: <179553795742.327668.17908781831724510646.b4-ty@b4>
Date: Tue, 24 Nov 2026 11:32:37 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=320; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=lXih8MstoYXHfUZ87usSbt2rL2rCDOllrk5JMU7mf88=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJZ93jnRQQWf7vJPoMh9JN6GbvOT9cFnPNvPn9kfltzn
 9JlLv1zHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzE9hLDX6GlDl13xdUzvTYW
 yXpkzjEMY8yarOjkvNSr8gGH4YEfJxn+++UWOu5cm/Nru9mE42w/H91RUZFm2e1e0PaNs3pZTMl
 jTgA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 19 Nov 2026 16:14:53 +0800, Wang Haoran wrote:
> clk: versatile-icst: release regmap on registration failure

Applied, thanks!

[1/1] clk: versatile-icst: release regmap on registration failure
      https://git.kernel.org/clk/linux/c/f0e15ebf8965

Best regards,
-- 
Brian Masney <masneyb@kernel.org>


